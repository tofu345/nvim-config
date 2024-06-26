local set = vim.opt

vim.lsp.set_log_level("off")

vim.g.have_nerd_font = false
set.showmode = true -- show if in insert, visual modes etc.
set.expandtab = true

set.signcolumn = "yes"

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
    let g:netrw_fastbrowse = 0
    let g:netrw_banner = 0 " Hide netrw top bar
    " let g:netrw_liststyle = 3

    let g:foldmethod = "manual"

    " beam cursor insert mode
    :set guicursor=i-ci:ver30-iCursor-blinkwait300-blinkon200-blinkoff150

    :set textwidth=0
 
    let g:ftplugin_sql_omni_key = '<C-j>'
]])
