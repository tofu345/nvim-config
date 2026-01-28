return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters = {
				prettier = {
					append_args = { "--tab-width", "4" },
				},
				["clang-format"] = {
					append_args = { "--style=file:/home/tofs/.clang-format" },
				},
			},
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "gofmt" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				ocaml = { "ocamlformat" },
				python = { "black" },
				java = { "clang-format" },
				markdown = { "prettier" },
				["*"] = { "trim_whitespace" },
			},
		})

		vim.keymap.set("n", "<A-f>", function()
			require("conform").format({ bufnr = 0 })
		end, { desc = "Conform Format" })
	end,
}
