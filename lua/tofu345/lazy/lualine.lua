-- {
-- 	options = {
-- 		icons_enabled = false,
-- 		theme = "codedark",
-- 		component_separators = { left = "", right = "" },
-- 		section_separators = { left = "", right = "" },
-- 		disabled_filetypes = {
-- 			statusline = {},
-- 			winbar = {},
-- 		},
-- 		ignore_focus = {},
-- 		always_divide_middle = true,
-- 		globalstatus = false,
-- 		refresh = {
-- 			statusline = 1000,
-- 			tabline = 1000,
-- 			winbar = 1000,
-- 		},
-- 	},
-- 	sections = {
-- 		lualine_a = {
-- 			{
-- 				"buffers",
-- 				mode = 0,
-- 				use_mode_colors = false,
-- 				buffers_color = {
-- 					active = "grey",
-- 					inactive = "blue",
-- 				},
-- 			},
-- 		},
-- 		lualine_b = {},
-- 		lualine_c = {},
-- 		lualine_x = {},
-- 		lualine_y = {},
-- 		lualine_z = {},
-- 	},
-- 	inactive_sections = {
-- 		lualine_a = {},
-- 		lualine_b = {},
-- 		lualine_c = {},
-- 		lualine_x = {},
-- 		lualine_y = {},
-- 		lualine_z = {},
-- 	},
-- 	tabline = {},
-- 	winbar = {},
-- 	inactive_winbar = {},
-- 	extensions = {},
-- }

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function() end,
}
