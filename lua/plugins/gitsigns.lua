return {
	"lewis6991/gitsigns.nvim",
	lazy = true,
	event = { "BufReadPre", "BufReadPost", "BufNewFile" },
	config = function()
		require("gitsigns").setup({})
	end,
}
