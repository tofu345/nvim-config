return {
	"tamago324/lir.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local lir = require("lir")
		local actions = require("lir.actions")

		lir.setup({
			hide_cursor = false,
			show_hidden_files = true,
			ignore = {},
			devicons = {
				enable = true,
				highlight_dirname = false,
			},
			mappings = {
				-- ["q"] = actions.quit,

				["<C-m>"] = actions.edit,
				["-"] = actions.up,
				["l"] = actions.edit,
				["h"] = actions.up,

				["%"] = actions.newfile,
				["dd"] = actions.mkdir,

				["cd"] = actions.cd,
				["_"] = function()
					-- go to :pwd
					vim.cmd("edit " .. vim.fn.getcwd())
				end,

				["Y"] = actions.yank_path,

				["."] = function()
					-- from vim-dirvish, inserts ":! {path}" into the command-line.
					local ctx = lir.get_context()
					local keys = ":! '%/" .. ctx:current().value .. "'<Home><C-Right>"
					local escaped = vim.api.nvim_replace_termcodes(keys, true, false, true)
					vim.api.nvim_feedkeys(escaped, "n", false)
				end,

				["gx"] = function()
					local filename = lir.get_context():current().fullpath
					vim.ui.open(filename)
				end,
			},
			float = nil,
			on_init = function() end,
			get_filters = function()
				return {}
			end,
		})

		require("nvim-web-devicons").setup({
			default = true,
		})

		vim.keymap.set("n", "-", [[<Cmd>execute 'e ' .. expand('%:p:h')<CR>]], { noremap = true })
	end,
}
