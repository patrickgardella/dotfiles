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
  },

  {
    -- https://github.com/mfussenegger/nvim-lint
    "mfussenegger/nvim-lint",
    config = function()
      require('lint').linters_by_ft = {
        markdown = { 'vale' },
        lua = { 'luacheck' },
        yaml = { 'yamllint' },
      }
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          -- try_lint without arguments runs the linters defined in `linters_by_ft`
          -- for the current filetype
          require("lint").try_lint()

          -- You can call `try_lint` with a linter name or a list of names to always
          -- run specific linters, independent of the `linters_by_ft` configuration
          -- require("lint").try_lint("cspell")
        end,
      })
    end,
  },
  --{
  -- https://github.com/mhartington/formatter.nvim
  --    "mhartington/formatter.nvim",
  --    config = function()
  --      -- Utilities for creating configurations
  --      local util = require "formatter.util"
  --
  --      -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
  --      require("formatter").setup {
  --        -- Enable or disable logging
  --        logging = true,
  --        -- Set the log level
  --        log_level = vim.log.levels.WARN,
  --        -- All formatter configurations are opt-in
  --        filetype = {
  --          -- Formatter configurations for filetype "lua" go here
  --          -- and will be executed in order
  --
  --          lua = {
  --            -- "formatter.filetypes.lua" defines default configurations for the
  --            -- "lua" filetype
  --            require("formatter.filetypes.lua").stylua,
  --
  --            -- You can also define your own configuration
  --            function()
  --              -- Supports conditional formatting
  --              if util.get_current_buffer_file_name() == "special.lua" then
  --                return nil
  --              end
  --
  --              -- Full specification of configurations is down below and in Vim help
  --              -- files
  --              return {
  --                exe = "stylua",
  --                args = {
  --                  "--search-parent-directories",
  --                  "--stdin-filepath",
  --                  util.escape_path(util.get_current_buffer_file_path()),
  --                  "--",
  --                  "-",
  --                },
  --                stdin = true,
  --              }
  --            end
  --          },
  --
  --          hcl = {
  --            function()
  --              return {
  --                exec = "terragrunt",
  --                args = { "hclfmt" },
  --                stdin = false
  --              }
  --            end
  --          },
  --
  --          -- Use the special "*" filetype for defining formatter configurations on
  --          -- any filetype
  --          ["*"] = {
  --            -- "formatter.filetypes.any" defines default configurations for any
  --            -- filetype
  --            require("formatter.filetypes.any").remove_trailing_whitespace,
  --            -- Remove trailing whitespace without 'sed'
  --            -- require("formatter.filetypes.any").substitute_trailing_whitespace,
  --          }
  --        }
  --      }
  --    end
  --
  --  }
}
