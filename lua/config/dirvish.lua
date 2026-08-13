vim.pack.add({
    { src = "https://github.com/justinmk/vim-dirvish" },
    { src = "https://github.com/tpope/vim-eunuch" },
})

vim.g.dirvish_mode = [[sort ,^.*[\/],]] -- netrw like
vim.g.dirvish_relative_paths = 0
