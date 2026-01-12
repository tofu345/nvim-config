return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
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
				"markdown",
			},
			auto_install = true,
			highlight = {
				enable = true,
				disable = function(lang, buf)
					-- disable slow treesitter highlight for large files
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
				additional_vim_regex_highlighting = false,
			},
		})
		vim.cmd(":silent TSUpdate")
	end,
}
