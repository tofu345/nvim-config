local set = vim.opt

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
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4

set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true
set.isfname:append("@-@")
set.updatetime = 50

-- Spellcheck
-- https://www.reddit.com/r/neovim/comments/1fwqc8t/comment/lqh201n/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
local spell_types = { "markdown" }
vim.opt.spell = false
vim.api.nvim_create_augroup("Spellcheck", { clear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = "Spellcheck", -- Grouping the command for easier management
	pattern = spell_types, -- Only apply to these file types
	callback = function()
        if vim.bo.modifiable then
            vim.opt_local.spell = true -- Enable spellcheck for these file types
        end
	end,
	desc = "Enable spellcheck for defined filetypes", -- Description for clarity
})
