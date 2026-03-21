local function createDir()
	local name = vim.fn.input("New Directory: ")
	if not name then
		return
	end

	local path = vim.fn.expand("%") .. name
	vim.cmd('silent !mkdir -p "' .. path .. '"')
	vim.cmd("edit") -- reload buffer
	vim.fn.search(name .. "/$") -- place cursor on newly created directory
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

-- my nvim-tree mapping overwrites the default dirvish mapping
vim.keymap.set("n", "-", "<plug>(dirvish_up)", { buffer = true, desc = "Parent Directory" })

vim.keymap.set("n", "%", newFile, { buffer = true, desc = "Create file" })
vim.keymap.set("n", "dd", createDir, { buffer = true, desc = "Create new directory" })
vim.keymap.set("n", "_", editCwd, { buffer = true, desc = "Go to Current Working Directory" })

-- default gx does not work in dirvish
vim.keymap.set("n", "gx", function()
	local filepath = vim.fn.getline(".")
	local _, err = vim.ui.open(filepath)
	if err then
		print(err)
	end
end, { buffer = true, desc = "Open the filepath at the cursor with system handler" })
