return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		delete_to_trash = true,
		view_options = {
			show_hidden = true, -- Show files and directories that start with "."
		},
	},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
