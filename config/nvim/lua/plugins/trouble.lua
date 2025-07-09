return {
  --https://github.com/folke/trouble.nvim

  -- Use: `:Trouble`
  -- Validated: 7/12/2024

  "folke/trouble.nvim",

  --dependencies = { "nvim-tree/nvim-web-devicons" },
  dependencies = { "mini.icons" },

  opts = {},

  config = function()
    require("mini.icons").setup()
    MiniIcons.mock_nvim_web_devicons()

    require("trouble").setup()
  end,

}
