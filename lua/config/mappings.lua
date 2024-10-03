local fns = require("util.fns").functions

local M = {}

-- Import keymap locally
local map = vim.keymap.set

-- Standard options abstraction with support for mode array
local function set_keymap(modes, lhs, rhs, desc)
	local options = { noremap = true, silent = true, desc = desc }
	if type(modes) == "table" then
		for _, mode in ipairs(modes) do
			map(mode, lhs, rhs, options)
		end
	else
		map(modes, lhs, rhs, options)
	end
end

M.setup = function()
	-- Normal mode mappings
	set_keymap("n", "<Space>", "<Nop>", nil)
	set_keymap("n", "<leader>y", '"+y', "Yank to system clipboard")

	-- Panes
	set_keymap("n", "<C-h>", "<C-w>h", "Navigate to the left pane")
	set_keymap("n", "<C-j>", "<C-w>j", "Navigate to the below pane")
	set_keymap("n", "<C-k>", "<C-w>k", "Navigate to the above pane")
	set_keymap("n", "<C-l>", "<C-w>l", "Navigate to the right pane")

	-- NvimTree
	set_keymap("n", "<C-n>", function()
		require("nvim-tree.api").tree.toggle()
	end, "Toggle nvimtree")
	set_keymap("n", "<leader>e", function()
		require("nvim-tree.api").tree.focus()
	end, "Focus nvimtree")

	-- Telescope
	set_keymap("n", "<leader>fs", function()
		require("telescope.builtin").live_grep()
	end, "Telescope Grep")
	set_keymap("n", "<leader>ff", function()
		require("telescope.builtin").find_files()
	end, "Telescope find files")
	set_keymap("n", "<leader>fi", function()
		require("telescope.builtin").current_buffer_fuzzy_find()
	end, "Telescope in buffer")

	-- Gitsigns
	set_keymap("n", "<C-b>", "<Cmd> Gitsigns blame <CR>", "Open Git blame")
	set_keymap("n", "<leader>gb", "<Cmd> Gitsigns blame_line <CR>", "Blame current line")
	set_keymap("n", "<C-g>", "<Cmd> Gitsigns next_hunk <CR>", "Navigate to the next Git hunk")

	-- Insert mode mappings
	set_keymap("i", "jk", "<Esc>", "Escape insert mode")

	-- Visual mode mappings
	set_keymap({ "v", "x" }, "<leader>y", '"+y', "Yank to system clipboard")

	-- Terminal mode mappings
	set_keymap("t", "<Esc>", [[<C-\><C-n>]], "Exit terminal mode")

	-- Custom Function mappings
	set_keymap({ "n", "v" }, "<leader>cd", function()
		fns.LspRename()
	end, "Rename usages of the current highlight")
end

return M
