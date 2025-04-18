return {
	-- https://github.com/CopilotC-Nvim/CopilotChat.nvim
	-- Validated: 7/24/24
	--
	-- Consider enabling:
	-- https://github.com/nvim-telescope/telescope-ui-select.nvim
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main",
		dependencies = {
			{ "github/copilot.vim" },              -- or zbirenbaum/copilot.lua
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log wrapper
		},
		build = "make tiktoken",
		opts = {
			debug = true, -- Enable debugging
			-- See Configuration section for rest
		},
		-- See Commands section for default commands if you want to lazy load on them
	},
}
