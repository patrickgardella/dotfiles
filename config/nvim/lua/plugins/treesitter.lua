return {
  "nvim-treesitter/nvim-treesitter",

  branch = "main",
  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = {
        "asm",
        "arduino",
        "bash",
        "c",
        "c_sharp",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "rust",
        "javascript",
        "html",
        "markdown",
        "markdown_inline",
        "r",
        "rnoweb" },
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true
      },
    })
  end,
}
