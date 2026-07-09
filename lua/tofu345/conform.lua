vim.pack.add({
    { src = "https://github.com/stevearc/conform.nvim" },
})

require("conform").setup({
    formatters = {
        stylua = { append_args = { "--indent-type", "Spaces" } },
        prettier = { append_args = { "--tab-width", "4" } },
        ["clang-format"] = { append_args = { "--style=file:/home/tofs/.clang-format" } },
    },
    formatters_by_ft = {
        lua = { "stylua" },
        go = { "gofmt" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        haskell = { "fourmolu" },
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
    require("conform").format({ async = true, bufnr = 0 })
end, { desc = "Conform Format" })
