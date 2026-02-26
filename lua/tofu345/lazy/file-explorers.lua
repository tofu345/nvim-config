local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")
	api.map.on_attach.default(bufnr)

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- @alex-courtis https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#change-root-to-global-current-working-directory
	local function change_root_to_global_cwd()
		local global_cwd = vim.fn.getcwd(-1, 0)
		api.tree.change_root(global_cwd)
	end

	-- @eddiebergman https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#h-j-k-l-style-navigation-and-editing
	local function edit_or_open()
		local node = api.tree.get_node_under_cursor()
		if node.type == "directory" then
			api.node.open.edit() -- expand or collapse
		else
			api.node.open.edit() -- open file
			api.tree.close() -- close the tree if file was opened
		end
	end
	-- open as vsplit on current node
	local function vsplit_preview()
		local node = api.tree.get_node_under_cursor()
		if node.type == "directory" then
			api.node.open.edit() -- expand or collapse
		else
			api.node.open.vertical() -- open file as vsplit
		end
		api.tree.focus() -- finally refocus on tree if it was lost
	end

	local function tcd()
		local node = api.tree.get_node_under_cursor()
		if node == nil then
			return
		end

		local path
		if node.type == "directory" then
			path = node.absolute_path
		else
			path = node.parent.absolute_path
		end
		vim.api.nvim_input(":tcd " .. path .. "<CR>")
		api.tree.change_root(path)
	end

	vim.keymap.set("n", "!", function()
		local node = api.tree.get_node_under_cursor()
		if node == nil then
			return
		end
		vim.api.nvim_input(":! '" .. node.absolute_path .. "'<Home><Right>") -- surround with quotes
	end, opts("Run Shell Command on Node at Cursor"))

	vim.keymap.set("n", "_", change_root_to_global_cwd, opts("Change Root To Global Working Directory"))
	vim.keymap.set("n", "cd", tcd, opts("Change (Tab) Working Directory"))

	vim.keymap.set("n", "h", api.node.navigate.parent, opts("Parent Directory"))
	vim.keymap.set("n", "l", edit_or_open, opts("Edit"))

	vim.keymap.set("n", "H", api.tree.close, opts("Close"))
	vim.keymap.set("n", "L", "<cmd>wincmd o<cr>", opts("Close other windows"))
	vim.keymap.set("n", "<C-V>", vsplit_preview, opts("Open: Vertical Split"))

	vim.keymap.del("n", "c", { buffer = bufnr })
	vim.keymap.del("n", "p", { buffer = bufnr })
	vim.keymap.del("n", "x", { buffer = bufnr })
	vim.keymap.del("n", "d", { buffer = bufnr })
	vim.keymap.del("n", "bd", { buffer = bufnr })
	vim.keymap.del("n", "e", { buffer = bufnr })
	vim.keymap.del("n", "<C-R>", { buffer = bufnr })
	-- vim.keymap.del("n", "<C-E>", { buffer = bufnr })
	vim.keymap.del("n", "S", { buffer = bufnr }) -- slow and uncancellable :|
end

return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"justinmk/vim-dirvish",

		"tpope/vim-eunuch",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	config = function()
		require("nvim-web-devicons").setup({
			default = true,
			variant = "dark",
			color_icons = true,
		})

		require("nvim-tree").setup({
			filesystem_watchers = {
				ignore_dirs = { "/home/tofs/.local", "/home/tofs/.config", "/home/tofs/.undodir" },
			},
			on_attach = my_on_attach,
			disable_netrw = false,
			hijack_netrw = false,
			view = {
				width = 40,
			},
			filters = {
				enable = false,
			},
			renderer = {
				full_name = true,
				group_empty = true,
				icons = {
					web_devicons = {
						file = { color = true },
						folder = { color = true },
					},
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

		vim.cmd([[
            let g:dirvish_mode='sort ,^.*[\/],' " netrw like
            let g:dirvish_relative_paths = 0
        ]])

		vim.keymap.set("n", "-", [[<CMD>NvimTreeToggle<CR>]])
		vim.keymap.set("n", "<leader>ff", [[<CMD>NvimTreeFindFile!<CR>]])
		vim.keymap.set("n", "<leader>pv", [[<CMD>Dirvish<CR>]], { desc = "File Explorer" })
	end,
}
