return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    vim.lsp.enable({
      'lua_ls',
      'rust_analyzer',
      'yamlls',
      'bashls',
      'markdown_oxide',
    })
  end
}
