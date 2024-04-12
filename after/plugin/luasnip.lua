require("luasnip.loaders.from_snipmate").lazy_load({ paths = "~/.config/nvim/snippets" })

local ls = require("luasnip")

ls.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedi",
	enable_autosnippets = true,
})

vim.keymap.set({ "i" }, "<C-K>", function()
	require("luasnip").expand()
end, { silent = true })
