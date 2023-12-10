function! neoformat#formatters#haskell#enabled() abort
    return ['ormolu']
endfunction

function! neoformat#formatters#haskell#ormolu() abort
    let opts = get(g:, 'ormolu_ghc_opt', [])
    if opts != []
        let opts = '-o' . join(opts, ' -o')
    else
        let opts = ''
    endif
    return {
        \ 'exe' : 'ormolu',
        \ 'args': [opts],
        \ 'stdin' : 1,
        \ }
endfunction

