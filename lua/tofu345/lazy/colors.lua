return {
	"vague-theme/vague.nvim",
	lazy = false,
	priority = 1000, -- make sure to load this before all the other plugins
	config = function()
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

				vim.fn.sign_define("DapStopped", { text = "→", texthl = "", linehl = "", numhl = "" })
			end,
		})

		vim.cmd([[colorscheme vague]])
	end,
}
