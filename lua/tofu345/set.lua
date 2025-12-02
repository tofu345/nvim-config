local set = vim.opt

-- 1000 number of previously edited files for which the marks are remembered.
set.shada = "!,'1000,<50,s10,h"

vim.g.foldmethod = "manual"
vim.g.have_nerd_font = true

set.showmode = true
set.signcolumn = "yes"
set.termguicolors = true
set.autochdir = false

set.nu = true
set.relativenumber = true

set.scrolloff = 4
set.ignorecase = true
set.smartcase = true
set.hlsearch = false
set.incsearch = true
set.wrap = false

set.expandtab = true
set.tabstop = 8
set.softtabstop = 4
set.shiftwidth = 4

set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true
set.isfname:append("@-@")
set.updatetime = 50
