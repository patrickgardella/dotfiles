return {
  -- https://github.com/williamboman/mason-lspconfig.nvim
  -- https://github.com/stevearc/conform.nvim

  {
    "nvim-neotest/nvim-nio",
  },

  {
    -- https://github.com/rcarriga/nvim-dap-ui
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
  },

  {
    -- Config Help:
    -- https://davelage.com/posts/nvim-dap-getting-started/
    -- https://blog.cryptomilk.org/2024/01/02/neovim-dap-and-gdb-14-1/ & https://git.cryptomilk.org/users/asn/dotfiles.git/tree/dot_config/nvim

    -- https://github.com/jay-babu/mason-nvim-dap.nvim
    -- https://github.com/mfussenegger/nvim-dap

    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "mfussenegger/nvim-dap",
      "williamboman/mason.nvim",
    },
    --config = function()
    --	require("mason-nvim-dap").setup({
    opts = {
      ensure_installed = {
        "chrome",
        'bash',
        'bash-debug-adapter'
      },
      automatic_installation = true,
      handlers = {}, -- sets up dap in the predefined manner
    }
    --	})
    -- end
  }
}
