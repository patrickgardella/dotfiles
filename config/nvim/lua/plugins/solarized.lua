return {
  -- https://github.com/maxmx03/solarized.nvim
  -- Validated: 7/10/24

  'maxmx03/solarized.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.o.background = 'light' -- 'dark' or 'light'
    vim.cmd.colorscheme 'solarized'
  end,
}
