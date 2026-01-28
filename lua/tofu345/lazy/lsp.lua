vim.api.nvim_create_autocmd("LspAttach", {
	callback = function()
		local set = vim.keymap.set
		local builtin = require("telescope.builtin")
		-- local themes = require("telescope.themes")

		vim.keymap.set({ "i" }, "<C-K>", function()
			require("luasnip").expand()
		end, { buffer = true, desc = "LuaSnap Expand" })

		set("n", "grr", function()
			builtin.lsp_references({ layout_strategy = "flex" })
		end, { buffer = true, desc = "Lsp References" })

		set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = true, desc = "Lsp Code Action" })
		set("n", "<leader>vd", vim.diagnostic.open_float, { buffer = true, desc = "Lsp View Diagnostic Float" })
		set("n", "<leader>r", vim.lsp.buf.rename, { buffer = true, desc = "Lsp Rename" })
		set("n", "gd", vim.lsp.buf.definition, { buffer = true, desc = "Go to Definition" })

		set("n", "gli", "<CMD>LspInfo<CR>", { buffer = true })
		set("n", "gls", ":LspStop", { buffer = true })

		-- I like rounded borders
		set("n", "K", function()
			vim.lsp.buf.hover({ border = "rounded" })
		end, { buffer = true, desc = "Lsp Hover" })
		set("i", "<C-s>", function()
			vim.lsp.buf.signature_help({ border = "rounded" })
		end, { buffer = true, desc = "Lsp Signature Help" })
	end,
})

-- began with https://github.com/ThePrimeagen/init.lua
return {
	"neovim/nvim-lspconfig",
	lazy = false,
	priority = 900,
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"mason-org/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
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
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*", -- follow latest release.
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		vim.lsp.set_log_level("DEBUG")

		require("fidget").setup({
			notification = {
				window = {
					avoid = { "NvimTree" },
					winblend = 0,
				},
			},
		})

		require("mason-lspconfig").setup({
			ensure_installed = {
				"clangd",
				"lua_ls",
				"gopls",
				"pyright",
				"ts_ls",
			},
		})

		require("luasnip.loaders.from_snipmate").lazy_load({ paths = { "~/.config/nvim/snippets" } })
		local luasnip = require("luasnip")
		luasnip.config.set_config({
			history = true,
			updateevents = "TextChanged,TextChangedi",
			enable_autosnippets = true,
		})

		local cmp = require("cmp")
		cmp.setup({
			completion = { autocomplete = false },
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			window = {
				completion = cmp.config.window.bordered({ border = "rounded" }),
				documentation = cmp.config.window.bordered({ border = "rounded" }),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- For luasnip users.
				{
					name = "lazydev",
					group_index = 0, -- set group index to 0 to skip loading LuaLS completions
				},
			}, {
				{ name = "buffer" },
			}),
		})

		vim.diagnostic.config({
			virtual_lines = false,
			float = {
				focusable = false,
				border = "rounded",
				source = true,
			},
		})
	end,
}
