require("tofu345.remap")
require("tofu345.set")
require("tofu345.lazy_init")

local augroup = vim.api.nvim_create_augroup
local Group = augroup('user_group', {})
local autocmd = vim.api.nvim_create_autocmd

autocmd('LspAttach', {
    group = Group,
    callback = function(e)
        local opts = { buffer = e.buf }
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
		vim.keymap.set("n", "<leader>ca", function()
			vim.lsp.buf.code_action({
				filter = function(a)
					return a.isPreferred
				end,
				apply = true,
            })
        end, opts)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
    end
})
