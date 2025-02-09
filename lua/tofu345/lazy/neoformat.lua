return {
	"sbdchd/neoformat",
	config = function()
		vim.keymap.set("n", "<A-f>", "<Cmd>Neoformat<CR>", { desc = "Neoformat format" })

		vim.cmd([[
            " 0 = off, 1 = on
            " alignment globally
            let g:neoformat_basic_format_align = 0

            " trimmming of trailing whitespace globally
            let g:neoformat_basic_format_trim = 1

            " tab to spaces conversion globally
            let g:neoformat_basic_format_retab = 0
        ]])
	end,
}
