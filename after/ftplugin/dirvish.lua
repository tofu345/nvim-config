local function preview()
    local line = vim.fn.getline(".")
    vim.cmd(string.format("vertical pedit %s", line))
    vim.cmd("wincmd =")
end

vim.keymap.set("n", "%", ":e %", { buffer = true, desc = "Create file" })
vim.keymap.set("n", "dd", ":Mkdir %", { buffer = true, desc = "Create new directory" })
vim.keymap.set("n", "p", preview, { buffer = true, desc = "Preview file under cursor" })
