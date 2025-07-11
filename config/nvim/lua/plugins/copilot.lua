return {
  -- https://github.com/github/copilot.vim

  -- Setup: `:Copilot setup`
  -- Configuration validated: 7/10/24

  -- use :help copilot

  "github/copilot.vim",

  -- For mapping of keys, see `:help copilot-maps`

  -- i: only map the keybind to insert mode
  -- <C-Enter>: execute on ctrl+Enter
  -- copilot#Accept("<CR>") function to execute,
  --      argument is inserted if no suggestion found
  -- options:
  --  - silent:
  --      execute function without logging it in the command bar at the bottom
  vim.keymap.set("i", "<C-a>", "copilot#Accept('<CR>')", {
    silent = true,
    replace_keycodes = false,
    expr = true
  }),

  vim.keymap.set('i', '<C-j>', 'copilot#Next()', {
    expr = true,
    replace_keycodes = false,
    silent = true,
  }),

  vim.keymap.set('i', '<C-k>', 'copilot#Previous()', {
    expr = true,
    replace_keycodes = false,
    silent = true,
  }),

  vim.keymap.set('i', '<C-l>', 'copilot#Dismiss()', {
    expr = true,
    replace_keycodes = false,
    silent = true,
  }),
  vim.keymap.set('i', '<C-Enter>', 'copilot#Accept("<CR>")', {
    expr = true,
    replace_keycodes = false,
    silent = true,
  }),

}
