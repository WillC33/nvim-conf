return {
	"windwp/nvim-ts-autotag",
	lazy = true,
	opts = {},
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	event = { "BufReadPre", "BufReadPost", "BufNewFile" },
}
