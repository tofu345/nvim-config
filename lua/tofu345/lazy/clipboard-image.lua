return {
	"ekickx/clipboard-image.nvim",
	ft = "markdown",
	opts = {
		default = {
			img_dir = { "%:p:h", "images" }, -- So glad i found this https://github.com/ekickx/clipboard-image.nvim/discussions/15#discussioncomment-1953898
			img_dir_txt = "./images",
			-- img_handler = function(img)
			--              print(img.path)
			-- end,
			affix = "![](%s)", -- "![alt_text|width x height](%s)"
		},
	},
}
