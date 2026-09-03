return {
    "justinmk/vim-dirvish",
    dependencies = {
        "tpope/vim-eunuch"
    },
    config = function()
        vim.g.dirvish_mode = [[sort ,^.*[\/],]] -- netrw like
        vim.g.dirvish_relative_paths = 0
    end
}
