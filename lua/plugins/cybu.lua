return {
	"ghillb/cybu.nvim",
	branch = "main", -- timely updates
	-- branch = "v1.x", -- won't receive breaking changes
	dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" }, -- optional for icon support
	config = function()
		require("cybu").setup({
			style = {
				border = "rounded",
			},
			display_time = 300,
		})
		vim.keymap.set({ "n", "v" }, "<c-tab>", "<plug>(CybuLastusedPrev)")
		vim.keymap.set({ "n", "v" }, "<tab>", "<plug>(CybuLastusedNext)")
	end,
}
