vim.pack.add({
    { src = "https://github.com/nvim-mini/mini.pick" },
})

require("mini.pick").setup({
    window = {
        config = function()
            local height = math.floor(0.75 * vim.o.lines)
            local width = math.floor(0.8 * vim.o.columns)
            return {
                anchor = "NW",
                height = height,
                width = width,
                row = math.floor(0.5 * (vim.o.lines - height)),
                col = math.floor(0.5 * (vim.o.columns - width)),
            }
        end,
    },
    mappings = {
        scroll_down = "<C-d>",
        scroll_up = "<C-u>",
        delete_left = "",
    },
})
vim.keymap.set("n", "<leader>pf", "<CMD>Pick files<CR>")
vim.keymap.set("n", "<leader>ps", "<CMD>Pick grep<CR>")
vim.keymap.set("n", "<leader>l", "<CMD>Pick buffers<CR>")
vim.keymap.set("n", "<leader>sh", "<CMD>Pick help<CR>")
