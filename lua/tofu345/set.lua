local set = vim.opt

vim.lsp.set_log_level("off")

set.nu = true
set.relativenumber = true

set.ignorecase = true
set.smartcase = true

set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true

set.smartindent = true

set.wrap = false

set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true

set.hlsearch = false
set.incsearch = true

set.termguicolors = true

set.scrolloff = 8
set.isfname:append("@-@")

set.updatetime = 50
vim.cmd([[
    " Hide netrw top bar
    let g:netrw_banner = 1
    " let g:netrw_liststyle = 3 " 3=tree

    let g:foldmethod = "manual"
]])
