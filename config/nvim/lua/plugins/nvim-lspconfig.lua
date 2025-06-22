return {
  "neovim/nvim-lspconfig", -- If you enable the server here, then don't enable it in mason-lspconfig above!

  dependencies = {
    "williamboman/mason.nvim",           -- For installing LSP servers
    "williamboman/mason-lspconfig.nvim", -- For configuring LSP servers
  },

  -- Rad Lectures uses `efm` for all formatting, linting, etc
  -- See: https://www.youtube.com/watch?v=ZjMzBd1Dqz8&list=WL&index=19 1:35:00

  config = function()
    -- Server-specific settings. See `:help lspconfig-setup`

    local lspconfig = require('lspconfig')

    -- Configure the R lintr
    vim.g.LanguageClient_serverCommands = {
      r = { "R", "--slave", "-e", "languageserver::run()" } }

    -- Configure rust_analyzer
    vim.lsp.config('rust_analyzer', {
      settings = {
        ['rust-analyzer'] = {
          diagnostics = {
            enable = false
          }
        },
      },
    })

    lspconfig.rust_analyzer.setup {}

    -- https://ncona.com/2024/02/using-arduino-language-server-with-neovim
    lspconfig.arduino_language_server.setup {
      cmd = {
        "arduino-language-server",
        "-cli-config", "/home/patrick/.arduino15/arduino-cli.yaml",
        "-fqbn", "arduino:uvr:uno",
        "-cli", "/usr/bin/arduino-cli",
        "-clangd", "/usr/bin/clangd"
      }
    }

    lspconfig.yamlls.setup {
      settings = {
        yaml = {
          format = {
            enable = true
          },
          schemaStore = {
            enable = true
          }
        }
      }
    }

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
}
