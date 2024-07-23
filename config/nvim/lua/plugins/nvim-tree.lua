return {

    "nvim-tree/nvim-tree.lua",
    lazy = false,
    config = function()
        require("nvim-tree").setup({
            filters = {
                dotfiles = true,
            },
            view = {
                width = 30,
            },
        })
    end,

}
