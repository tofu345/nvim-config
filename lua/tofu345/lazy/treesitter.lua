return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install({
			"make",
			"c",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"ocaml",
			"heex",
			"javascript",
			"html",
		})
		vim.cmd(":silent TSUpdate")
	end,
}
