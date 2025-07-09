return {
	'echasnovski/mini.icons',

	opts = {},
	version = '*',
	lazy = true,

	specs = {
		{ "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
	},

	config = function()
		require('mini.icons').setup()
		MiniIcons.mock_nvim_web_devicons()
	end,
}
