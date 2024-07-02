-- trim whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	command = "%s/\\s\\+$//e",
})

return {
	"sbdchd/neoformat",
	config = function()
		vim.keymap.set("n", "<A-f>", "<Cmd>Neoformat<CR>")

		vim.cmd([[
            " 0 = off, 1 = on
            " disable alignment globally
            let g:neoformat_basic_format_align = 0

            " trimmming of trailing whitespace globally
            let g:neoformat_basic_format_trim = 0

            " Disable tab to spaces conversion globally
            let g:neoformat_basic_format_retab = 0
        ]])
	end,
}
