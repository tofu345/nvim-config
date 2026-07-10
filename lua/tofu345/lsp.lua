vim.pack.add({
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/stevearc/conform.nvim" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
    { src = "https://github.com/j-hui/fidget.nvim" },
    { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
    { src = "https://github.com/hrsh7th/cmp-buffer" },
    { src = "https://github.com/hrsh7th/cmp-path" },
    { src = "https://github.com/hrsh7th/cmp-cmdline" },
    { src = "https://github.com/hrsh7th/nvim-cmp" },
    { src = "https://github.com/L3MON4D3/LuaSnip", version = "v2.5.0" },
    { src = "https://github.com/saadparwaiz1/cmp_luasnip" },
})

require("conform").setup({
    formatters = {
        stylua = { append_args = { "--indent-type", "Spaces" } },
        prettier = { append_args = { "--tab-width", "4" } },
        -- ["clang-format"] = { append_args = { "--style=file:/home/tofs/.clang-format" } },
    },
    formatters_by_ft = {
        lua = { "stylua" },
        go = { "gofmt" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        -- haskell = { "fourmolu" },
        css = { "prettier" },
        html = { "prettier" },
        -- ocaml = { "ocamlformat" },
        -- python = { "black" },
        -- java = { "clang-format" },
        markdown = { "prettier" },
        ["*"] = { "trim_whitespace" },
    },
})
vim.keymap.set("n", "<A-f>", function()
    require("conform").format({ async = true, bufnr = 0 })
end, { desc = "Conform Format" })

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
    ensure_installed = {
        "lua_ls",
        "gopls",
        "codelldb",
	-- "black",
        -- "ts_ls",
        -- "stylua",
        -- "prettier",
    },
})
require("fidget").setup({})

local luasnip = require("luasnip")
require("luasnip.loaders.from_snipmate").lazy_load({
    paths = { vim.fn.stdpath("config") .. "/snippets" },
})
-- forget why this
-- luasnip.config.set_config({
--     history = true,
--     updateevents = "TextChanged,TextChangedi",
--     enable_autosnippets = true,
-- })
vim.keymap.set({ "i" }, "<C-L>", function()
    luasnip.expand()
end, { silent = true })

local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        completion = cmp.config.window.bordered({ border = "rounded" }),
        documentation = cmp.config.window.bordered({ border = "rounded" }),
    },
    -- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
            end
        end, { "i", "s" }),
        ["<C-n>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.locally_jumpable(1) then
                luasnip.jump(1)
            end
        end, { "i", "s" }),
        ["<C-y>"] = cmp.mapping(function()
            if cmp.visible() then
                if luasnip.expandable() then
                    luasnip.expand()
                else
                    cmp.confirm({ select = true })
                end
            end
        end, { "i", "s" }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-[>"] = cmp.mapping(function()
            cmp.mapping.close()
            vim.cmd.stopinsert()
        end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- For luasnip users.
        -- added in `after/ftplugin/lua.lua`
        { name = "lazydev", group_index = 0 },
    }, {
        { name = "buffer" },
    }),
})

vim.diagnostic.config({
    severity_sort = true,
    float = { source = "if_many" },
    underline = true,
})
