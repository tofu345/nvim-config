local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- @alex-courtis https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#change-root-to-global-current-working-directory
	local function change_root_to_global_cwd()
		local global_cwd = vim.fn.getcwd(-1, -1)
		api.tree.change_root(global_cwd)
	end

	-- @eddiebergman https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#h-j-k-l-style-navigation-and-editing
	local function edit_or_open()
		local node = api.tree.get_node_under_cursor()
		if node.nodes ~= nil then
			api.node.open.edit() -- expand or collapse folder
		else
			api.node.open.edit() -- open file
			api.tree.close() -- Close the tree if file was opened
		end
	end
	-- open as vsplit on current node
	local function vsplit_preview()
		local node = api.tree.get_node_under_cursor()
		if node.nodes ~= nil then
			api.node.open.edit() -- expand or collapse folder
		else
			api.node.open.vertical() -- open file as vsplit
		end
		api.tree.focus() -- Finally refocus on tree if it was lost
	end

	api.config.mappings.default_on_attach(bufnr)

	vim.keymap.set("n", "!", function()
		local node = api.tree.get_node_under_cursor()
		vim.api.nvim_input(":! '" .. node.absolute_path .. "'<Home><Right>") -- surround with quotes
	end, opts("Run Shell Command"))

	vim.keymap.set("n", "_", change_root_to_global_cwd, opts("Change Root To Global CWD"))
	vim.keymap.set("n", "h", api.tree.close, opts("Close"))
	vim.keymap.set("n", "l", edit_or_open, opts("Edit Or Open"))

	vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse All"))
	vim.keymap.set("n", "L", "<cmd>wincmd o<cr>", opts("Close other windows"))
	vim.keymap.set("n", "<C-V>", vsplit_preview, opts("Open: Vertical Split"))

	-- remove: copy, cut, delete, some rename variants
	vim.keymap.del("n", "c", { buffer = bufnr })
	vim.keymap.del("n", "p", { buffer = bufnr })
	vim.keymap.del("n", "x", { buffer = bufnr })
	vim.keymap.del("n", "d", { buffer = bufnr })
	vim.keymap.del("n", "bd", { buffer = bufnr })
	vim.keymap.del("n", "e", { buffer = bufnr })
	vim.keymap.del("n", "<C-R>", { buffer = bufnr })
end

return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	config = function()
		require("nvim-web-devicons").setup()
		require("nvim-tree").setup({
			on_attach = my_on_attach,
			disable_netrw = false,
			hijack_netrw = true,
			view = {},
			filters = {
				enable = false,
			},
			renderer = {
				full_name = true,
				group_empty = true,
				icons = {
					show = {},
					git_placement = "after",
					glyphs = {
						folder = {
							default = "",
							open = "",
							empty = "",
							empty_open = "",
						},
					},
				},
			},
			update_focused_file = {
				enable = true,
			},
			actions = {
				file_popup = {
					open_win_config = {
						col = 1,
						row = 1,
						relative = "cursor",
						border = "rounded",
						style = "minimal",
					},
				},
			},
		})

		vim.keymap.set("n", "-", "<cmd>NvimTreeToggle<cr>")
	end,
}
