return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			auto_install = true,
			sync_install = false,
			ignore_install = {},
			ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "ocaml", "heex", "javascript", "html" },
			highlight = {
				enable = true,
				disable = function(lang, buf)
					-- fixes error when opening undotree diffpanel
					if string.find(vim.api.nvim_buf_get_name(buf), "diffpanel_3") then
						return true
					end
					-- local max_filesize = 100 * 1024 -- 100 KB
					-- local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					-- if ok and stats and stats.size > max_filesize then
					-- 	return true
					-- end
				end,
			},
			indent = { enable = false }, -- so it was you all along...
		})

		vim.cmd(":silent TSUpdate")
	end,
}
