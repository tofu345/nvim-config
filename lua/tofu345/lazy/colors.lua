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
			-- make comments visible in diffs
			colors = { comment = "#6e6e8b" },
			on_highlights = function(hl, colors)
				hl.DiffText.bg = "#594833"

				-- a nicer color for TreesitterContext
				hl.TreesitterContext.bg = colors.bg
				hl.TreesitterContextLineNumber.bg = colors.bg

				-- remove background
				vim.fn.sign_define("DapStopped", { text = "→", texthl = "", linehl = "", numhl = "" })
			end,
		})

		vim.cmd([[colorscheme vague]])
	end,
}
