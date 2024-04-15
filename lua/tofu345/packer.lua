vim.cmd([[ packadd packer.nvim ]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- finder
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- errors
	use({
		"folke/trouble.nvim",
		requires = { { "nvim-tree/nvim-web-devicons" } },
		config = function()
			require("trouble").setup()
		end,
	})

	-- snippets
	use({
		"L3MON4D3/LuaSnip",
		tag = "v2.*",
		run = "make install_jsregexp",
	})

	-- language support
	use({
		"mrcjkb/rustaceanvim",
		ft = "rust",
		version = "^4",
	})
	use("ray-x/go.nvim")
	use("ray-x/guihua.lua")

	use("sbdchd/neoformat")

	use("theprimeagen/harpoon") -- convenient file markers
	use("mbbill/undotree") -- undo history

	-- git
	use("tpope/vim-fugitive")
	use("lewis6991/gitsigns.nvim")

	use("eandrju/cellular-automaton.nvim") -- <leader>fml

	-- comments ;-;
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use({
		"folke/todo-comments.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
		},
	})

	-- colour theme
	use({
		"rose-pine/neovim",
		as = "rose-pine",
	})

	-- welcome page
	use({
		"goolord/alpha-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	})

	-- bottom bar
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	-- Useful status updates for LSP.
	use("j-hui/fidget.nvim")
	use("folke/neodev.nvim") -- neovim docs

	use("nvim-treesitter/nvim-treesitter-context")
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("nvim-treesitter/playground")
	use("neovim/nvim-lspconfig")
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})
end)
