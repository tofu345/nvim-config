return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,
	dependencies = {
		"Shatur/neovim-ayu",
		"rktjmp/lush.nvim",
		"metalelf0/jellybeans-nvim",
	},
	config = function()
		require("rose-pine").setup({
			variant = "main",
			dim_inactive_windows = true,
			extend_background_behind_borders = true,
			enable = {
				migrations = true,
				terminal = true,
				legacy_highlights = true,
			},
			styles = {
				bold = true,
				italic = false,
				transparency = false,
			},
			highlight_groups = {
				Comment = { italic = false },
			},
			groups = {
				border = "muted",
				link = "iris",
				panel = "surface",

				error = "love",
				hint = "iris",
				info = "foam",
				note = "pine",
				todo = "rose",
				warn = "gold",

				git_add = "foam",
				git_change = "rose",
				git_delete = "love",
				git_dirty = "rose",
				git_ignore = "muted",
				git_merge = "iris",
				git_rename = "pine",
				git_stage = "iris",
				git_text = "rose",
				git_untracked = "subtle",

				h1 = "iris",
				h2 = "foam",
				h3 = "rose",
				h4 = "gold",
				h5 = "pine",
				h6 = "foam",
			},
		})

		vim.cmd("colorscheme rose-pine-main")

		-- Make background transparent
		-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end,
}
