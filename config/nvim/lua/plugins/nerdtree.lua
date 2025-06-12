return {
	-- https://github.com/preservim/nerdtree
	-- Start: `:NERDTree`
	-- Validated: 7/10/24

	-- NerdTree is a file system explorer for the Vim editor. It provides a tree view of files and directories,
	-- allowing users to navigate and manage their file system more easily.

	-- This plug is not supported any more. Consider migrating to nvim-tree.lua
	-- https://tao.zz.ac/vim/migrate-nerdtree-to-nvim-tree.html

	{
		"preservim/nerdtree",
		config = function()
			-- Add direct VimScript approach (this is the standard solution from NERDTree)
			vim.cmd([[
                                autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
                        ]])
		end,
	},

	-- https://github.com/tiagofumo/vim-nerdtree-syntax-highlight
	-- Validated: 7/10/24
	{ "tiagofumo/vim-nerdtree-syntax-highlight" },

	-- https://github.com/ryanoasis/vim-devicons
	-- Validated: 7/10/24
	{ "ryanoasis/vim-devicons" },
}
