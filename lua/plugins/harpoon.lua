return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup({}) -- REQUIRED

        vim.keymap.set("n", "<C-e>", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "Open Harpoon List" })

        vim.keymap.set("n", "<leader>a", function()
            harpoon:list():add()
        end, { desc = "Add to Harpoon List" })

        vim.keymap.set("n", "<C-h>", function()
            harpoon:list():select(1)
        end, { desc = "Harpoon #1" })
        vim.keymap.set("n", "<C-t>", function()
            harpoon:list():select(2)
        end, { desc = "Harpoon #2" })
        vim.keymap.set("n", "<C-n>", function()
            harpoon:list():select(3)
        end, { desc = "Harpoon #3" })
        vim.keymap.set("n", "<C-s>", function()
            harpoon:list():select(4)
        end, { desc = "Harpoon #5" })

        vim.keymap.set("n", "<leader>h", function()
            harpoon:list():replace_at(1)
        end, { desc = "Change Harpoon #1" })
        vim.keymap.set("n", "<leader>t", function()
            harpoon:list():replace_at(2)
        end, { desc = "Change Harpoon #2" })
        vim.keymap.set("n", "<leader>n", function()
            harpoon:list():replace_at(3)
        end, { desc = "Change Harpoon #3" })
        vim.keymap.set("n", "<leader>s", function()
            harpoon:list():replace_at(4)
        end, { desc = "Change Harpoon #4" })
    end,
}
