return {
    "sbdchd/neoformat",
    config = function ()
        -- vim.cmd([[
        --     augroup fmt
        --         autocmd!
        --         " autocmd BufWritePre * undojoin | Neoformat
        --         autocmd BufWritePre * Neoformat
        --     augroup END
        -- ]])

        vim.keymap.set("n", "<A-f>", "<Cmd>Neoformat<CR>")

        vim.cmd([[ 
            " disable alignment globally
            let g:neoformat_basic_format_align = 0

            " disabletrimmming of trailing whitespace globally
            let g:neoformat_basic_format_trim = 0

            " Disable tab to spaces conversion globally
            let g:neoformat_basic_format_retab = 0
        ]])
    end
}
