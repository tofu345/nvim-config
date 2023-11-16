function ColorMyPencils(color)
	color = color or "rose-pine-main"
	vim.cmd.colorscheme(color)

	-- Make background transparent
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
