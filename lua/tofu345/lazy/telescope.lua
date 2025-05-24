return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup({
			defaults = {
				layout_config = {
					horizontal = { width = 0.9, preview_width = 0.5 },
				},
			},
		})

		local builtin = require("telescope.builtin")
		local themes = require("telescope.themes")

		-- vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

		vim.keymap.set("n", "<leader>pf", function()
			builtin.find_files({ no_ignore = true, hidden = false })
		end, { desc = "File Finder" })
		vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Git Files" })

		-- vim.keymap.set("n", "<leader>ps", function()
		-- 	builtin.live_grep(themes.get_ivy({ height = 0.5 }))
		-- end, {}, { desc = "Live Grep" })

		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Help" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		-- vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
	end,
	lazy = false,
}
