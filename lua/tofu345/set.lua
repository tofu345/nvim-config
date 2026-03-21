local set = vim.opt

set.number = true
set.relativenumber = true
set.signcolumn = "yes"
set.termguicolors = true

set.ignorecase = true
set.smartcase = true
set.hlsearch = false
set.incsearch = true
set.wrap = false

set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true

set.scrolloff = 4

set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true
set.isfname:append("@-@")
set.shortmess:append("S") -- show 'search hit BOTTOM, continuing at TOP'
set.swapfile = false

-- '1000 - number of previously edited files for which the marks are remembered.
set.shada = "!,'1000,<50,s10,h"
