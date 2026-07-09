vim.pack.add({
    { src = "https://github.com/L3MON4D3/LuaSnip", version = "v2.5.0" },
})

require("luasnip.loaders.from_snipmate").lazy_load({
    paths = { vim.fn.stdpath("config") .. "/snippets" },
})

local luasnip = require("luasnip")

-- forget why this
luasnip.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedi",
    enable_autosnippets = true,
})

vim.keymap.set({ "i" }, "<C-L>", function()
    luasnip.expand()
end, { silent = true })
