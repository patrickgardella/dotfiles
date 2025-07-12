return {
  {
    -- Telescope fuzzy finding (all the things)
    -- https://github.com/nvim-telescope/telescope.nvim
    -- Start: `:Telescope find_files`

    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    lazy = false, -- if you don't load it, you can't use it
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = vim.fn.executable("make") == 1
      },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<C-u>"] = false,
              ["<C-d>"] = false,
            },
          },
        },
        pickers = {
          find_files = {
            hidden = true, -- Show hidden files
          },
          live_grep = {
            theme = "dropdown",
            previewer = false,
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
              -- even more opts
            }
          }
        },
      })

      pcall(require("telescope").load_extension("ui-select"))

      -- Enable telescope fzf native, if installed
      pcall(require("telescope").load_extension, "fzf")

      vim.keymap.set('n', '<leader>fk', ':Telescope keymaps<CR>')
      vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>')
      vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>')
      vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>')
      vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>')
    end,
  },
}
