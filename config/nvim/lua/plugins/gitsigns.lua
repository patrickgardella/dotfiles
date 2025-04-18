return {
	-- https://github.com/lewis6991/gitsigns.nvim

	-- Setup: `:Gitsigns setup`
	-- Configuration validated: 7/12/24
	--
	-- Gitsigns is a Neovim plugin that provides Git integration for Neovim. Used for Trouble.nvim

	"lewis6991/gitsigns.nvim",
	config = function()
		require('gitsigns').setup()
	end
}
