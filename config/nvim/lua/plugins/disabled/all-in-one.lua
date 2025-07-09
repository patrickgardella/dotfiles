return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      'williamboman/mason.nvim',
    },

    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "williamboman/mason.nvim",           -- For installing LSP servers
      "williamboman/mason-lspconfig.nvim", -- For configuring LSP servers
    },

    config = function()
      local lspconfig = require('lspconfig')

      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
            format = {
              enable = true,
              -- Put format options here
              -- NOTE: the value should be String!
              defaultConfig = {
                indent_style = 'space',
                indent_size = '2',
              },
            },
            workspace = {
              library = { vim.env.VIMRUNTIME },
              checkThirdParty = false,
            },
          },
        },
      })
    end
  },
}
