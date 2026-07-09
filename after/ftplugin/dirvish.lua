local function createDirectory()
    local name = vim.fn.input("New Directory: ")
    if not name then
        return
    end

    local path = vim.fn.expand("%") .. name
    vim.cmd('!mkdir -p "' .. path .. '"')
    vim.cmd("edit") -- reload
    vim.fn.search("^" .. path .. "/$") -- place cursor on newly created directory
end

local function newFile()
    local name = vim.fn.input("New file: ")
    if not name then
        return
    end

    vim.cmd("edit %" .. name)
end

local function editCwd()
    vim.cmd("edit " .. vim.fn.getcwd())
end

vim.keymap.set("n", "%", newFile, { buffer = true, desc = "Create file" })
vim.keymap.set("n", "dd", createDirectory, { buffer = true, desc = "Create new directory (Unix)" })
vim.keymap.set("n", "_", editCwd, { buffer = true, desc = "Go to Current Working Directory" })

-- default gx does not work in dirvish
vim.keymap.set("n", "gx", function()
    local filepath = vim.fn.getline(".")
    local _, err = vim.ui.open(filepath)
    if err then
        print(err)
    end
end, { buffer = true, desc = "Open the filepath at the cursor with system handler" })
