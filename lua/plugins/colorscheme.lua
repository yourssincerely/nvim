return {
    {
        "RRethy/base16-nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("base16-colorscheme").with_config({
                telescope = false,
                indentblankline = false,
                notify = false,
                ts_rainbow = false,
                cmp = false,
                illuminate = false,
                dapui = false,
            })
            vim.cmd("colorscheme base16-onedark-dark")
        end,
    },
}
