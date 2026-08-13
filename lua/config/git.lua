vim.pack.add({
    { src = "https://github.com/tpope/vim-fugitive" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
})

require("gitsigns").setup()

vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Open Git Signs" })
