return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters = {
				prettier = {
					append_args = { "--tab-width", "4" },
				},
			},
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "gofmt" },
				typescript = { "prettier" },
				-- javascript = { "prettier" },
				markdown = { "prettier" },
				["*"] = { "trim_whitespace" },
			},
		})

		vim.keymap.set("n", "<A-f>", function()
			require("conform").format({ bufnr = 0 })
		end)
	end,
}
