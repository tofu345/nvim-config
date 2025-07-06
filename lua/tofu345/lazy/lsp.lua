vim.lsp.set_log_level("off")

local user_group = vim.api.nvim_create_augroup("lsp_user_keymaps", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
	group = user_group,
	callback = function(e)
        local builtin = require("telescope.builtin")
        local themes = require("telescope.themes")

		-- local opts = { buffer = e.buf }
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover({ border = "rounded" })
		end, { buffer = e.buf, desc = "Lsp Hover" })

		vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { buffer = e.buf, desc = "Lsp Diagnostic Float" })
		vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = e.buf, desc = "Lsp Rename" })
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = e.buf, desc = "Lsp Go to Definition" })

		vim.keymap.set("n", "grr", function()
            builtin.lsp_references(themes.get_ivy({ height = 0.5 }))
        end, { buffer = e.buf, desc = "Lsp References" })

		vim.keymap.set("n", "<leader>ca", function()
			vim.lsp.buf.code_action({
				filter = function(a)
					return a.isPreferred
				end,
				apply = true,
			})
		end, { buffer = e.buf, desc = "Lsp Code Action" })

		vim.keymap.set("n", "[d", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end, { buffer = e.buf, desc = "Lsp Diagnostic Go To Next" })
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end, { buffer = e.buf, desc = "Lsp Diagnostic Go To Prev" })

		vim.keymap.set("i", "<C-s>", function()
			vim.lsp.buf.signature_help({ border = "rounded" })
		end, { buffer = e.buf, desc = "Lsp Signature Help" })
	end,
})

-- yoinked from the primeagens init.lua https://github.com/ThePrimeagen/init.lua
return {
	"neovim/nvim-lspconfig",
	lazy = false,
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"folke/neodev.nvim",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
		require("neodev").setup()

		require("fidget").setup({
			progress = {
				suppress_on_insert = true, -- Suppress new messages while in insert mode
				ignore_done_already = true, -- Ignore new tasks that are already complete
				-- ignore = { "hls" },                  -- List of LSP servers to ignore
				display = {
					render_limit = 5, -- How many LSP messages to show at once
				},
			},
		})

        -- would not run in require("mason-lspconfig").setup()
		require("lspconfig").lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		require("mason").setup()
		require("mason-lspconfig").setup({
			automatic_installation = false,
			ensure_installed = {},
            automatic_enable = true,
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,

				["hls"] = function()
					require("lspconfig")["hls"].setup({
						filetypes = { "haskell", "lhaskell", "cabal" },
					})
				end,

				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								completion = {
									callSnippet = "Replace",
								},
							},
						},
					})
				end,

				["gopls"] = function()
					-- local util = require("lspconfig.util")
					-- require("lspconfig").gopls.setup({
					-- 	root_dir = function(fname)
					-- 		-- see: https://github.com/neovim/nvim-lspconfig/issues/804
					-- 		local mod_cache = vim.trim(vim.fn.system("go env GOMODCACHE"))
					-- 		if fname:sub(1, #mod_cache) == mod_cache then
					-- 			local clients = vim.lsp.get_active_clients({ name = "gopls" })
					-- 			if #clients > 0 then
					-- 				return clients[#clients].config.root_dir
					-- 			end
					-- 		end
					-- 		return util.root_pattern("go.work")(fname) or util.root_pattern("go.mod", ".git")(fname)
					-- 	end,
					-- })
				end,
			},
		})

		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- For luasnip users.
			}, {
				{ name = "buffer" },
			}),
			-- `:` cmdline setup.
			-- cmp.setup.cmdline(":", {
			-- 	mapping = cmp.mapping.preset.cmdline(),
			-- 	sources = cmp.config.sources({
			-- 		{ name = "path" },
			-- 	}, {
			-- 		{ name = "cmdline" },
			-- 	}),
			-- 	matching = { disallow_symbol_nonprefix_matching = false },
			-- }),
		})

		vim.diagnostic.config({
			virtual_text = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = true,
				header = "",
				prefix = "",
			},
		})
	end,
}
