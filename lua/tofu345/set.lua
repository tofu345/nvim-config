local set = vim.opt

vim.lsp.set_log_level("debug")

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
-- set.signcolumn = "yes"
set.isfname:append("@-@")

set.updatetime = 50

-- local opjs = { noremap = true, silent = true }

vim.cmd([[
    " Hide netrw top bar
    let g:netrw_banner = 0

    set foldmethod=indent   
    set foldnestmax=10
    set nofoldenable
    set foldlevel=2  
]])
