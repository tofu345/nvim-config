function! neoformat#formatters#typescript#enabled() abort
    return ['clangformat']
endfunction

function! neoformat#formatters#typescript#clangformat() abort
    return {
        \ 'exe': 'clang-format',
        \ 'args': ["-style='{BasedOnStyle: LLVM, IndentWidth: 4}'", '-assume-filename=' . expand('%:t')],
        \ 'stdin': 1,
        \ 'try_node_exe': 1,
        \ }
endfunction
