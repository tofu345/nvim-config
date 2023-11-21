function! neoformat#formatters#c#enabled() abort
    return ['clangformat']
endfunction

function! neoformat#formatters#c#clangformat() abort
    return {
        \ 'exe': 'clang-format',
        \ 'args': ["-style='{BasedOnStyle: LLVM, IndentWidth: 4}'"],
        \ 'stdin': 1
        \ }
endfunction

" function! neoformat#formatters#c#{{ other formatter name }}() abort
"   return {'exe': {{ other formatter name }}
" endfunction

