return {
    "ts-26a/vim-darkspace",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd([[
            set background=dark termguicolors
            let g:darkspace_italics=1
            colorscheme darkspace

            hi StatusLine   guifg=fg guibg=bg
            hi StatusLineNC guibg=bg
            hi TabLineSel   guifg=fg guibg=bg
            hi TabLine      guibg=bg
            hi LineNr       guifg=#4e545d
            hi link EndOfBuffer LineNr
            hi CursorLineNr guibg=bg
            hi SignColumn   guifg=white
            hi TreesitterContext guibg=#0c0c0c
            hi WarningMsg   guifg=NvimLightYellow
            "hi clear MatchParen

            " copied from https://github.com/vague-theme/vague.nvim
            hi DiffAdd      guifg=fg guibg=#293125
            hi DiffChange   guifg=fg guibg=#41362a
            hi DiffDelete   guifg=fg guibg=#3b242a
            hi DiffText     guifg=fg guibg=#6d583e
            hi link DiffTextAdd DiffText

            " transparent background
            hi Normal guibg=none
            hi NormalFloat guibg=none
        ]])

        vim.fn.sign_define("DapStopped", { text = "→", linehl = "CursorLine" })
    end,
}
