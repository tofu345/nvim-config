vim.pack.add({
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
})

require("nvim-web-devicons").setup()

-- https://neovim.io/doc/user/pack/#vim.pack-events
-- perform { ..., build = 'make' }
--
-- this is going to get annoying quick.
vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        -- Run build script after plugin's code has changed
        if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
            vim.system({ "make" }, { cwd = ev.data.path }):wait()
        end
    end,
})

require("telescope").setup({
    defaults = {
        mappings = {},
        layout_config = {
            -- vertical = { width = 0.9, preview_height = 0 },
            horizontal = { width = 0.9, preview_width = 0.5 },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case", the default case_mode is "smart_case"
        },
    },
})
require("telescope").load_extension("fzf")

local builtin = require("telescope.builtin")
local themes = require("telescope.themes")

vim.keymap.set("n", "<leader>l", function()
    builtin.buffers({
        layout_strategy = "flex",
        show_all_buffers = true,
        sort_lastused = false,
        ignore_current_buffer = false,
        select_current = true,
    })
end, { desc = "List buffers" })

vim.keymap.set("n", "<leader>pf", function()
    builtin.find_files({ no_ignore = true, hidden = true })
end, { desc = "File Finder" })

vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Git Files" })

vim.keymap.set("n", "<leader>ps", function()
    builtin.live_grep(themes.get_ivy({ height = 0.5 }))
end, { desc = "Live Grep" })

vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Help" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search Keymaps" })
vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "Search Select Telescope" })
