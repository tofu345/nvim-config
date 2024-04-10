function! neoformat#formatters#svelte#enabled() abort
    return ['prettierd']
endfunction

function! neoformat#formatters#svelte#prettierd() abort
    return {
        \ 'exe': 'prettierd',
        \ 'args': ['"%:p"'],
        \ 'stdin': 1,
        \ }
endfunction
