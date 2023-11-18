vim.cmd([[
    augroup fmt
        autocmd!
        autocmd BufWritePre * undojoin | Neoformat
    augroup END

    nnoremap <silent> <leader>f :Format<CR>
    nnoremap <silent> <leader>F :FormatWrite<CR>
]])
