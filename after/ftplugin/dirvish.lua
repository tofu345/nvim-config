local function createDir()
    local input = vim.fn.input("Mkdir: ")
	local name = vim.fn.expand("%") .. input
	local handle = io.popen("mkdir -p \"" .. name .. '\"')
	if handle ~= nil then
		local result = handle:read("*a")
		handle:close()
		if result ~= "" then
			print(result)
		end
        vim.cmd("edit")
        vim.fn.search(input .. "/$")
	end
end

vim.keymap.set("n", "%", ":e %", { buffer = true, desc = "Create file" })
vim.keymap.set("n", "dd", createDir, { buffer = true, desc = "Create new directory" })
vim.keymap.set("n", "q", "<nop>", { buffer = true }) -- breaks buffer local mappings sometimes, use alternate-file
