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
		vim.keymap.set("n", "gr", function()
			builtin.lsp_references(require("telescope.themes").get_cursor({
				layout_config = { height = 20, width = 130, preview_width = 65 },
			}))
		end)
		vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions)

		vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
		vim.keymap.set("n", "<C-p>", builtin.git_files, {})
		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
		vim.keymap.set("n", "<leader>ph", builtin.help_tags, {})

		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
	end,
	lazy = false,
}
