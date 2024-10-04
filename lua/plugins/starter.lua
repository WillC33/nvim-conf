local header = [[ 
ooooo      ooo                                  o8o                    
`888b.     `8'                                  `"'                    
 8 `88b.    8   .ooooo.   .ooooo.  oooo    ooo oooo  ooo. .oo.  .oo.   
 8   `88b.  8  d88' `88b d88' `88b  `88.  .8'  `888  `888P"Y88bP"Y88b  
 8     `88b.8  888ooo888 888   888   `88..8'    888   888   888   888  
 8       `888  888    .o 888   888    `888'     888   888   888   888  
o8o        `8  `Y8bod8P' `Y8bod8P'     `8'     o888o o888o o888o o888o 

]]

local pad = string.rep(" ", 22)
local new_section = function(name, action, section)
	return { name = name, action = action, section = pad .. section }
end

return {
	{
		"echasnovski/mini.starter",
		version = "*",
		lazy = false,
		-- No need to copy this inside `setup()`. Will be used automatically.
		opts = {
			-- Whether to open starter buffer on VimEnter. Not opened if Neovim was
			-- started with intent to show something else.
			autoopen = true,

			-- Whether to evaluate action of single active item
			evaluate_single = false,

			-- Items to be displayed. Should be an array with the following elements:
			-- - Item: table with <action>, <name>, and <section> keys.
			-- - Function: should return one of these three categories.
			-- - Array: elements of these three types (i.e. item, array, function).
			-- If `nil` (default), default items will be used (see |mini.starter|).
			items = { new_section("", "ene | startinsert", "") },

			-- Header to be displayed before items. Converted to single string via
			-- `tostring` (use `\n` to display several lines). If function, it is
			-- evaluated first. If `nil` (default), polite greeting will be used.
			header = header,

			-- Footer to be displayed after items. Converted to single string via
			-- `tostring` (use `\n` to display several lines). If function, it is
			-- evaluated first. If `nil` (default), default usage help will be shown.
			footer = function()
				local fortune = require("fortune").get_fortune()
				return table.concat(fortune, "\n")
			end,

			-- Array  of functions to be applied consecutively to initial content.
			-- Each function should take and return content for 'Starter' buffer (see
			-- |mini.starter| and |MiniStarter.content| for more details).
			content_hooks = nil,

			-- Characters to update query. Each character will have special buffer
			-- mapping overriding your global ones. Be careful to not add `:` as it
			-- allows you to go into command mode.
			query_updaters = "abcdefghijklmnopqrstuvwxyz0123456789_-.",

			-- Whether to disable showing non-error feedback
			silent = false,
		},
	},
	{
		"rubiin/fortune.nvim",
		lazy = false,
		dependencies = { "echasnovski/mini.nvim" },
		opts = {},
	},
}
