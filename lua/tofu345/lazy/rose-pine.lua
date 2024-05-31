return {
    "rose-pine/neovim",
    as = "rose-pine",
    config = function ()
        function ColorMyPencils()
            -- Make background transparent
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end

        require("rose-pine").setup({
            styles = {
                italic = false,
            },
        })

        vim.cmd("colorscheme rose-pine")
        ColorMyPencils()
    end
}
