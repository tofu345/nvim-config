" https://stackoverflow.com/a/48817071/33053458
function! RemoveQuickfixItems()
  let list = getqflist()
  call remove(list, line(".") - 1)
  call setqflist(list, "r")
endfunction

autocmd FileType qf nmap <buffer> dd :call RemoveQuickfixItems()<CR>
autocmd FileType qf vmap <buffer> dd :call RemoveQuickfixItems()<CR>
