-- include .vimrc
-- local vimrc = "~/.vimrc"
-- vim.cmd.source(vimrc)

require("tofu345")

vim.g.clipboard = {
    name= 'WslClipboard',
    copy= {
        ['+']= 'clip.exe',
        ['*']= 'clip.exe',
    },
    paste= {
        ['+']= 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        ['*']= 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled= 0,
}

