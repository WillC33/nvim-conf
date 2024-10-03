return {
	"williamboman/mason-lspconfig.nvim",
	lazy = true,
	event = "BufReadPre",
	dependencies = { "williamboman/mason.nvim" },
	opts = {
		ensure_installed = {
			"lua_ls",
			"efm",
			"bashls",
			"ts_ls",
			"tailwindcss",
			"pyright",
			"html",
			"cssls",
			"emmet_ls",
			"svelte",
			"omnisharp",
			"jsonls",
		},
		automatic_installation = true,
	},
}
