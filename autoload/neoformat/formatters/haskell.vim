" function! neoformat#formatters#haskell#enabled() abort
"     return ['hindent']
" endfunction
"
" function! neoformat#formatters#haskell#hindent() abort
"     return {
"         \ 'exe' : 'hindent',
"         \ 'args': ['--indent-size ' . shiftwidth()],
"         \ 'stdin' : 1,
"         \ }
" endfunction

" function! neoformat#formatters#haskell#stylishhaskell() abort
"     return {
"         \ 'exe': 'stylish-haskell',
"         \ 'stdin': 1,
"         \ }
" endfunction
