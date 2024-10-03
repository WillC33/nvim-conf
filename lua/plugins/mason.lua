return {
	"williamboman/mason.nvim",
	lazy = false,
	opts = {
		ensure_installed = {
			"lua_ls",
			"vim",
			"vimdoc",
			"efm",
			"html",
			"css",
			"javascript",
			"tsx",

			-- Web
			"typescript-language-server",
			"eslint_d",
			"prettierd",
			"svelte-language-server",

			-- dotnet
			"ionide",
			"omnisharp",
			"julia",
			"ocaml-lsp",
			"ocamlformat",
		},

		highlight = {
			enable = true,
			use_languagetree = true,
		},

		indent = { enable = true },
	},
}
