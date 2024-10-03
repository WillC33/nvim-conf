return {
	"nvim-treesitter/nvim-treesitter",
	tag = "v0.9.2",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua",
				"html",
				"css",
				"typescript",
				"javascript",
				"tsx",
				"julia",
				"ocaml",
				"svelte",
				"c_sharp",
				"fsharp",
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			auto_install = true,
		})
	end,
}
