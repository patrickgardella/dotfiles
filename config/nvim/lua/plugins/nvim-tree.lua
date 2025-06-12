return {

  "nvim-tree/nvim-tree.lua",
  lazy = false,
  config = function()
    require("nvim-tree").setup({
      filters = {
        dotfiles = false, --show dotfiles
      },
      view = {
        width = 30,
      },
    })

    -- open nvim-tree when starting nvim
    local function open_nvim_tree()
      -- open the tree
      require("nvim-tree.api").tree.open()
    end

    vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

    -- https://github.com/nvim-tree/nvim-tree.lua/wiki/Auto-Close
    vim.api.nvim_create_autocmd("BufEnter", {
      nested = true,
      callback = function()
        if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
          vim.cmd("quit")
        end
      end,
    })
  end,
}
