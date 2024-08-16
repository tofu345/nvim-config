return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
				sync_install = false,
				highlight = {
					enable = true,
					disable = function(lang, buf)
						if string.find(vim.api.nvim_buf_get_name(buf), "diffpanel_3") then
							return true
						end
						-- local max_filesize = 100 * 1024 -- 100 KB
						-- local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        -- throws error when opening undotree diffpanel
						-- if ok and stats and stats.size > max_filesize then
						-- 	return true
						-- end
					end,
				},
				indent = { enable = true },
			})

			vim.cmd(":silent TSUpdate")
		end,
	},
}
