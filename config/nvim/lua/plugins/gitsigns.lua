return {
	-- https://github.com/lewis6991/gitsigns.nvim

	-- Setup: `:Gitsigns setup`
	-- Configuration validated: 7/12/24
	--
	-- Gitsigns is a Neovim plugin that provides Git integration for Neovim. Used for Trouble.nvim

	"lewis6991/gitsigns.nvim",
	config = function()
		require('gitsigns').setup({
			on_attach = function(bufnr)
				local gs = require('gitsigns')
				local map = function(keys, func, desc)
					vim.keymap.set('n', keys, func, { noremap = true, silent = true, buffer = bufnr, desc = desc })
				end

				-- Hunk navigation
				map(']h', gs.next_hunk,    'Next hunk')
				map('[h', gs.prev_hunk,    'Previous hunk')

				-- Hunk actions
				map('<leader>hs', gs.stage_hunk,   'Stage hunk')
				map('<leader>hr', gs.reset_hunk,   'Reset hunk')
				map('<leader>hu', gs.undo_stage_hunk, 'Undo stage hunk')
				map('<leader>hp', gs.preview_hunk, 'Preview hunk')

				-- File-level actions
				map('<leader>hS', gs.stage_buffer,  'Stage buffer')
				map('<leader>hR', gs.reset_buffer,  'Reset buffer')

				-- Blame
				map('<leader>hb', function() gs.blame_line({ full = true }) end, 'Blame line')
				map('<leader>hB', gs.toggle_current_line_blame, 'Toggle line blame')

				-- Diff
				map('<leader>hd', gs.diffthis, 'Diff this')
			end
		})
	end
}
