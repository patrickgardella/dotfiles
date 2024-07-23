return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "asm",
				"arduino",
				"bash",
				"c",
				"c_sharp",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"rust",
				"javascript",
				"html",
				"markdown",
				"markdown_inline",
				"r",
				"rnoweb" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
