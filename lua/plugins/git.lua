return {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    dependencies = {
        "tpope/vim-fugitive",
    },
    opts = {},
    keys = {
        { "<leader>gs", vim.cmd.Git, desc = "Open Git Signs" },
    },
}
