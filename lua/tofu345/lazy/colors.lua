return {
	"rktjmp/lush.nvim",
	name = "colors",
	lazy = false,
	priority = 1000, -- make sure to load this before all the other plugins
	dependencies = {
		"vague-theme/vague.nvim",
		"rose-pine/neovim",
		"Shatur/neovim-ayu",
		"metalelf0/jellybeans-nvim",
	},
	config = function()
		require("rose-pine").setup({
			variant = "main",
			dim_inactive_windows = false,
			extend_background_behind_borders = true,
			enable = {
				migrations = true,
				terminal = true,
				legacy_highlights = true,
			},
			styles = {
				bold = true,
				italic = false,
				transparency = true,
			},
			highlight_groups = {
				Comment = { italic = false },
				CursorLine = { bg = "base" },
				TreesitterContext = { bg = "base" },
				TreesitterContextLineNumber = { bg = "base" },
			},
			groups = {},
		})

		require("vague").setup({
			transparent = true,
			bold = true,
			italic = true,
			style = {
				-- "none" is the same thing as default. But "italic" and "bold" are also valid options
				boolean = "bold",
				number = "none",
				float = "none",
				error = "bold",
				comments = "italic",
				conditionals = "none",
				functions = "none",
				headings = "bold",
				operators = "none",
				strings = "italic",
				variables = "none",
			},
			on_highlights = function(hl, colors)
				hl.TreesitterContext.bg = colors.bg
				hl.TreesitterContextLineNumber.bg = colors.bg

				local black = "#000000"
				hl.TabLineSel = { fg = colors.fg, bg = black }
				hl.TabLine = { fg = colors.comment, bg = black }
				hl.TabLineFill.bg = black

				vim.fn.sign_define('DapStopped', {text='→', texthl='', linehl='', numhl=''})
			end,
		})

		vim.cmd([[colorscheme vague]])

		-- vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "#131416" })
		-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end,
}
