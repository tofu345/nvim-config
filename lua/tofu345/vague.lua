vim.pack.add({
    { src = "https://github.com/vague-theme/vague.nvim" },
})

require("vague").setup({
    transparent = true,
    on_highlights = function(hl, colors)
        hl.DiffText.bg = "#594833"

        vim.api.nvim_set_hl(0, "TreesitterContext", { bg = colors.bg })
        vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { bg = colors.bg })

        -- remove background
        vim.fn.sign_define("DapStopped", { text = "→", texthl = "", linehl = "", numhl = "" })
    end,
})
vim.cmd.colorscheme("vague")
