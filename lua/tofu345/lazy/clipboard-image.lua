return {
	"ekickx/clipboard-image.nvim",
	ft = "markdown",
	opts = {
		markdown = {
			img_dir = { "images" },
			img_dir_txt = "./images",
			affix = "![](%s)",
			-- affix = "![alt_text|width x height](%s)",
		},
	},
}
