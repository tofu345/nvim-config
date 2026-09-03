return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "stevearc/conform.nvim",
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        {
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
                library = {
                    -- See the configuration section for more details
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
        "j-hui/fidget.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            build = "make install_jsregexp",
        },
        "saadparwaiz1/cmp_luasnip",
    },
    config = function()
        require("conform").setup({
            formatters = {
                stylua = { append_args = { "--indent-type", "Spaces" } },
                prettier = { append_args = { "--tab-width", "4" } },
            },
            formatters_by_ft = {
                lua = { "stylua" },
                -- go = { "gofmt" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                css = { "prettier" },
                html = { "prettier" },
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
                "prettier",
                "stylua",
            },
        })
        require("fidget").setup({})

        local luasnip = require("luasnip")
        require("luasnip.loaders.from_snipmate").lazy_load({
            paths = { vim.fn.stdpath("config") .. "/snippets" },
        })
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
    end,
}
