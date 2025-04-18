-- Fancier statusline
return {
	-- https://github.com/nvim-lualine/lualine.nvim
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = 'auto',
				component_separators = "|",
				section_separators = "",
			},
		})
	end,
}
