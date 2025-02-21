return {
	"stevearc/oil.nvim",
	opts = {
		delete_to_trash = true,
		view_options = {
			show_hidden = true, -- Show files and directories that start with "."
		},
		keymaps = {
			["g?"] = "actions.show_help",
			["gd"] = {
				desc = "Toggle file detail view",
				callback = function()
					OIL_DETAIL_VIEW = not OIL_DETAIL_VIEW
					if OIL_DETAIL_VIEW then
						require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
					else
						require("oil").set_columns({ "icon" })
					end
				end,
			},
			["<CR>"] = "actions.select",
			["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
			["<C-h>"] = {
				"actions.select",
				opts = { horizontal = true },
				desc = "Open the entry in a horizontal split",
			},
			["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
			["<C-p>"] = "actions.preview",
			["<C-c>"] = "actions.close",
			["<C-l>"] = "actions.refresh",
			["-"] = "actions.parent",
			["_"] = "actions.open_cwd",
			["`"] = "actions.cd",
			["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory", mode = "n" },
			["gs"] = "actions.change_sort",
			["gx"] = "actions.open_external",
			["g."] = "actions.toggle_hidden",
			["g\\"] = "actions.toggle_trash",
		},
	},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
