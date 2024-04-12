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
