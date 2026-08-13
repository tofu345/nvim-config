local function createDir()
    vim.ui.input({ prompt = "New Directory: " }, function(input)
	if input then
	    local path = vim.fn.expand("%") .. input
	    vim.cmd('silent !mkdir -p "' .. path .. '"')
	    vim.cmd("edit") -- reload buffer
	    vim.fn.search("^" .. path .. "/$") -- place cursor on newly created directory
	end
    end)
end

local function newFile()
    vim.ui.input({ prompt = "New File: " }, function(input)
	if input then
	    vim.cmd("edit %" .. input)
	end
    end)
end

local function editCwd()
    vim.cmd("edit " .. vim.fn.getcwd())
end

vim.keymap.set("n", "%", newFile, { buffer = true, desc = "Create file" })
vim.keymap.set("n", "dd", createDir, { buffer = true, desc = "Create new directory (Unix)" })
vim.keymap.set("n", "_", editCwd, { buffer = true, desc = "Go to Current Working Directory" })

-- default gx does not work in dirvish
vim.keymap.set("n", "gx", function()
    local filepath = vim.fn.getline(".")
    local _, err = vim.ui.open(filepath)
    if err then
	print(err)
    end
end, { buffer = true, desc = "Open the filepath at the cursor with system handler" })
