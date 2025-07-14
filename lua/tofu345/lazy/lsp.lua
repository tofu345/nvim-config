vim.api.nvim_create_autocmd("LspAttach", {
	callback = function()
		local builtin = require("telescope.builtin")
		local themes = require("telescope.themes")
		local set = vim.keymap.set

		set("n", "K", function()
			vim.lsp.buf.hover({ border = "rounded" })
		end, { buffer = true, desc = "Lsp Hover" })

		set("n", "<leader>vd", vim.diagnostic.open_float, { buffer = true, desc = "Lsp Diagnostic Float" })
		set("n", "<leader>r", vim.lsp.buf.rename, { buffer = true, desc = "Lsp Rename" })
		set("n", "gd", vim.lsp.buf.definition, { buffer = true, desc = "Lsp Go to Definition" })

		set("n", "grr", function()
			builtin.lsp_references(themes.get_ivy({ height = 0.5 }))
		end, { buffer = true, desc = "Lsp References" })

		set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = true, desc = "Lsp Code Action" })

		set("n", "[d", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end, { buffer = true, desc = "Lsp Diagnostic Go To Next" })
		set("n", "]d", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end, { buffer = true, desc = "Lsp Diagnostic Go To Prev" })

		set("i", "<C-s>", function()
			vim.lsp.buf.signature_help({ border = "rounded" })
		end, { buffer = true, desc = "Lsp Signature Help" })
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
		vim.lsp.set_log_level("off")

		-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
		require("neodev").setup()

		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		require("fidget").setup({
			progress = {
				suppress_on_insert = true, -- Suppress new messages while in insert mode
				ignore_done_already = true, -- Ignore new tasks that are already complete
				-- ignore = {},                  -- List of LSP servers to ignore
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
		})

		vim.diagnostic.config({
			virtual_text = false,
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
