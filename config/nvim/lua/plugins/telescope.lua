return {
  {
    -- Telescope fuzzy finding (all the things)
    -- https://github.com/nvim-telescope/telescope.nvim

    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = vim.fn.executable("make") == 1
      },
    },
    keys = {
      { "<leader>fk", "<cmd>Telescope keymaps<cr>",    desc = "Find keymaps" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>",    desc = "Find buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>",  desc = "Find help tags" },
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
            require("telescope.themes").get_dropdown {}
          }
        },
      })

      pcall(require("telescope").load_extension, "ui-select")
      pcall(require("telescope").load_extension, "fzf")
    end,
  },
}
