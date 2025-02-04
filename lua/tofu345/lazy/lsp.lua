vim.lsp.set_log_level("off")

local augroup = vim.api.nvim_create_augroup
local Group = augroup("user_group", {})
local autocmd = vim.api.nvim_create_autocmd

autocmd("LspAttach", {
	group = Group,
	callback = function(e)
		local opts = { buffer = e.buf }
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts, { desc = "Lsp Hover" })
		vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts, { desc = "Lsp Diagnostic Float" })
		vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts, { desc = "Lsp Rename" })
		vim.keymap.set("n", "<leader>vrr", function()
			vim.lsp.buf.references()
		end, opts, { desc = "Lsp References" })
		vim.keymap.set("n", "<leader>ca", function()
			vim.lsp.buf.code_action({
				filter = function(a)
					return a.isPreferred
				end,
				apply = true,
			})
		end, opts, { desc = "Lsp Code Action" })
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts, { desc = "Lsp Go to Definition" })
		vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts, { desc = "Lsp Signature Help" })
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts, { desc = "Lsp Diagnostic Go To Prev" })
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts, { desc = "Lsp Diagnostic Go To Prev" })
	end,
})

-- yoinked from the primagens init.lua https://github.com/ThePrimeagen/init.lua
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

		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
			},
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
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = { version = "Lua 5.1" },
								diagnostics = {
									globals = { "vim", "it", "describe", "before_each", "after_each" },
								},
							},
						},
					})
				end,

				["gopls"] = function()
					local util = require("lspconfig.util")
					require("lspconfig").gopls.setup({
						root_dir = function(fname)
							-- see: https://github.com/neovim/nvim-lspconfig/issues/804
							local mod_cache = vim.trim(vim.fn.system("go env GOMODCACHE"))
							if fname:sub(1, #mod_cache) == mod_cache then
								local clients = vim.lsp.get_active_clients({ name = "gopls" })
								if #clients > 0 then
									return clients[#clients].config.root_dir
								end
							end
							return util.root_pattern("go.work")(fname) or util.root_pattern("go.mod", ".git")(fname)
						end,
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
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- For luasnip users.
			}, {
				{ name = "buffer" },
			}),
		})

		vim.diagnostic.config({
			-- update_in_insert = true,
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
