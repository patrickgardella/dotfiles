return {
  -- I've seen the following in other configs, so research it when I'm bored
  -- cmd = "Mason",
  -- event = "BufReadPre",

  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  lazy = false,
  config = function()
    require("mason").setup()
  end
}
