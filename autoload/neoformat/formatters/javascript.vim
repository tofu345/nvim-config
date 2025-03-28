function! neoformat#formatters#javascript#enabled() abort
    return ['prettier']
endfunction

function! neoformat#formatters#javascript#prettier() abort
    return {
            \ 'exe': 'prettier',
            \ 'args': ['--stdin-filepath', '"%:p"', '--parser', 'typescript', '--tab-width', '4'],
            \ 'stdin': 1,
            \ 'try_node_exe': 1,
            \ }
endfunction

