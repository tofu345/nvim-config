vim.pack.add({
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
    { src = "https://github.com/j-hui/fidget.nvim" },
})

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
    ensure_installed = {
        "lua_ls",
        "gopls",
        "codelldb",
        -- "ts_ls",
        -- "stylua",
        -- "prettier",
    },
})
require("fidget").setup({})

vim.diagnostic.config({
    severity_sort = true,
    float = { source = "if_many" },
    underline = true,
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            workspace = {
                -- remove undefined global 'vim' errors
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
    },
})
vim.lsp.enable({ "lua_ls" })
