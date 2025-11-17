local function createDir()
	local input = vim.fn.input("New Directory: ")
	if not input then
		return
	end
	local name = vim.fn.expand("%") .. input
	local handle = io.popen('mkdir -p "' .. name .. '"')
	if handle ~= nil then
		local result = handle:read("*a")
		handle:close()
		if result ~= "" then
			print(result)
			return
		end
		vim.cmd("edit")
		vim.fn.search(input .. "/$")
	end
end

local function newFile()
	local input = vim.fn.input("New file: ")
	if not input then
		return
	end
	vim.cmd("edit %" .. input)
end

local function editCwd()
	local cwd = vim.fn.getcwd()
	vim.cmd("e " .. cwd)
end

vim.keymap.set("n", "%", newFile, { buffer = true, desc = "Create file" })
vim.keymap.set("n", "dd", createDir, { buffer = true, desc = "Create new directory" })
vim.keymap.set("n", "_", editCwd, { buffer = true, desc = "Edit Current Working Directory" })

-- breaks buffer local mappings sometimes, use alternate-file
vim.keymap.set("n", "q", "<nop>", { buffer = true })
vim.keymap.set("n", "gq", "<nop>", { buffer = true })
