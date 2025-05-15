function! neoformat#formatters#css#enabled() abort
   return ['prettier']
endfunction

function! neoformat#formatters#css#prettier() abort
    return {
        \ 'exe': 'prettier',
        \ 'args': ['--stdin-filepath', '"%:p"', '--tab-width', '4'],
        \ 'stdin': 1,
        \ 'try_node_exe': 1,
        \ }
endfunction
