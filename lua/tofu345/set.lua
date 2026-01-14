local set = vim.opt

-- 1000 number of previously edited files for which the marks are remembered.
set.shada = "!,'1000,<50,s10,h"

set.shortmess:append("S") -- show 'search hit BOTTOM, continuing at TOP'

set.spell = false
set.foldmethod = "manual"
set.showmode = true
set.signcolumn = "yes"
set.termguicolors = true
set.autochdir = false

set.number = true
set.relativenumber = true

set.scrolloff = 4
set.ignorecase = true
set.smartcase = true
set.hlsearch = false
set.incsearch = true
set.wrap = false

set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = false

set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true
set.isfname:append("@-@")
set.updatetime = 50
