-- vim.cmd([[
--     augroup fmt
--         autocmd!
--         " autocmd BufWritePre * undojoin | Neoformat
--         autocmd BufWritePre * Neoformat
--     augroup END
--
--     nnoremap <silent> <leader>f :Format<CR>
--     nnoremap <silent> <leader>F :FormatWrite<CR>
-- ]])

vim.keymap.set("n", "<A-f>", "<Cmd>Neoformat<CR>")

vim.cmd([[ 
    " Enable alignment globally
    let g:neoformat_basic_format_align = 1

    " Enable trimmming of trailing whitespace globally
    let g:neoformat_basic_format_trim = 1

    " Disable tab to spaces conversion globally
    let g:neoformat_basic_format_retab = 0
]])
