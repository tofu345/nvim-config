return {
    "vague-theme/vague.nvim",
    lazy = false,
    config = function()
        require("vague").setup({
            transparent = true,
            colors = {
                comment = "#737390",
            },
            on_highlights = function(hl, colors)
                hl.DiffText.bg = "#463928"
                hl.DiffChange.bg = "#2a241e"

                vim.api.nvim_set_hl(0, "TreesitterContext", { bg = colors.bg })
                vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { bg = colors.bg })

                -- remove background
                vim.fn.sign_define("DapStopped", { text = "→", texthl = "", linehl = "CursorLine", numhl = "" })
            end,
        })
        vim.cmd.colorscheme("vague")
    end
}
