local M = {}

-- set keymaps on the active lsp server
M.on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true }

	-- Lspsaga mappings
	vim.keymap.set("n", "<leader>fd", "<cmd>Lspsaga finder<CR>", opts) -- Go to definition
	vim.keymap.set("n", "<leader>gD", "<cmd>Lspsaga peek_definition<CR>", opts) -- Peek definition
	vim.keymap.set("n", "<leader>gd", "<cmd>Lspsaga goto_definition<CR>", opts) -- Go to definition
	vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- Code action
	vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- Rename
	vim.keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- Show line diagnostics
	vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- Show cursor diagnostics
	vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- Previous diagnostic
	vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- Next diagnostic
	vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- Show hover doc

	-- Pyright specific mapping
	if client.name == "pyright" then
		vim.keymap.set("n", "<Leader>oi", "<cmd>PyrightOrganizeImports<CR>", opts)
	end
end

M.diagnostic_signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = "" }

return M
