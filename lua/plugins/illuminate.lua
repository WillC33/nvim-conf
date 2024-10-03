return {
	"RRethy/vim-illuminate",
	lazy = true,
	event = { "BufReadPre", "BufReadPost", "BufNewFile" },
	config = function()
		require("illuminate").configure({})
	end,
}
