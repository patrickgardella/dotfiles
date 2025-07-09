return {
  'echasnovski/mini.icons',

  opts = {},
  version = false,
  lazy = false,

  specs = {},

  config = function()
    require('mini.icons').setup()
    MiniIcons.mock_nvim_web_devicons()
  end,
}
