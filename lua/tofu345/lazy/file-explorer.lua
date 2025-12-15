local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#h-j-k-l-style-navigation-and-editing

	local function edit_or_open()
		local node = api.tree.get_node_under_cursor()
		if node and node.nodes ~= nil then
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

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	api.config.mappings.default_on_attach(bufnr)

	vim.keymap.set("n", "l", edit_or_open, opts("Edit Or Open"))
	vim.keymap.set("n", "L", vsplit_preview, opts("Vsplit Preview"))
	vim.keymap.set("n", "h", api.tree.close, opts("Close"))
	vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse All"))
end

return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	config = function()
		require("nvim-tree").setup({
			on_attach = my_on_attach,
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

		vim.keymap.set("n", "-", "<cmd>NvimTreeFindFile<cr>")
	end,
}
