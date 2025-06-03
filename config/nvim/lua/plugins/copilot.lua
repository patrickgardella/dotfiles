return {
	-- https://github.com/github/copilot.vim

	-- Setup: `:Copilot setup`
	-- Configuration validated: 7/10/24

	-- use :help copilot

	"github/copilot.vim",

	-- i: only map the keybind to insert mode
	-- <C-Enter>: execute on ctrl+Enter
	-- copilot#Accept("<CR>") function to execute,
	--      argument is inserted if no suggestion found
	-- options:
	--  - silent:
	--      execute function without logging it in the command bar at the bottom
	vim.keymap.set("i", "<C-Enter>", "copilot#Accept('<CR>')", { silent = true, expr = true }),
	-- vim.g.copilot_no_tab_map = true,

	vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
		expr = true,
		replace_keycodes = false
	})
}
