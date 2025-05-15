-- all hail teej, the goat 
-- https://github.com/tjdevries/advent-of-nvim/blob/master/nvim/plugin/floaterminal.lua
-- https://www.youtube.com/watch?v=AXsnL16qSyk, https://www.youtube.com/watch?v=8vmAa3dRpp0

local state = {
	buf = -1,
	win = -1,
}

local function floating_config(opts)
	opts = opts or {}

	-- Calculate the position to center the window
	local width = opts.width or math.floor(vim.o.columns * 0.8)
	local height = opts.height or math.floor(vim.o.lines * 0.8)
	local col = math.floor((vim.o.columns - width) / 2)
	local row = math.floor((vim.o.lines - height) / 2)

	return {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		style = "minimal", -- No borders or extra UI elements
		border = "rounded",
	}
end

local function create_floating_window(opts)
	opts = opts or {}

	-- Create a buffer
	local buf = nil
	if vim.api.nvim_buf_is_valid(opts.buf) then
		buf = opts.buf
	else
		buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
	end

	-- Create the floating window
	local win = vim.api.nvim_open_win(buf, true, floating_config())

	-- Enter insert mode
	vim.cmd("startinsert")

	return { buf = buf, win = win }
end

vim.api.nvim_create_autocmd("VimResized", {
	group = vim.api.nvim_create_augroup("custom-terminal-resized", {}),
	callback = function()
		if not vim.api.nvim_win_is_valid(state.win) or state.win == nil then
			return
		end

		vim.api.nvim_win_set_config(state.win, floating_config())
	end,
})

local toggle_terminal = function()
	if not vim.api.nvim_win_is_valid(state.win) then
		state = create_floating_window({ buf = state.buf })
		if vim.bo[state.buf].buftype ~= "terminal" then
			vim.cmd.terminal()
		end
	else
		vim.api.nvim_win_hide(state.win)
	end
end

vim.keymap.set("n", "<leader>tt", toggle_terminal, { noremap = true, silent = true })
