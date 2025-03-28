local set = vim.opt

vim.g.foldmethod = "manual"
vim.g.have_nerd_font = false
-- vim.g.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
vim.cmd([[
    :set guicursor=
]])

-- set.list = true
-- set.listchars = "tab:> ,trail:-,nbsp:+"

set.autochdir = false
set.showmode = true -- show if in insert, visual modes etc.
set.signcolumn = "yes"

set.nu = true
set.relativenumber = true

set.ignorecase = true
set.smartcase = true

set.expandtab = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4

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
    " let g:netrw_fastbrowse = 0
    " let g:netrw_banner = 0 " Hide netrw top bar
    " let g:netrw_liststyle = 3
    let g:ftplugin_sql_omni_key = '<C-j>'
]])

-- Spellcheck
-- https://www.reddit.com/r/neovim/comments/1fwqc8t/comment/lqh201n/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
local spell_types = { "markdown" }
vim.opt.spell = false
vim.api.nvim_create_augroup("Spellcheck", { clear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = "Spellcheck", -- Grouping the command for easier management
	pattern = spell_types, -- Only apply to these file types
	callback = function()
		vim.opt_local.spell = true -- Enable spellcheck for these file types
	end,
	desc = "Enable spellcheck for defined filetypes", -- Description for clarity
})
