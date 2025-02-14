return {
    {
        "echasnovski/mini.basics",
        version = false,
        config = function()
            require("mini.basics").setup({
                options = {
                    basic = true,
                    extra_ui = true,
                    win_borders = "default",
                },
                mappings = {},
                autocommands = {
                    basic = true,
                    relnum_in_visual_mode = true,
                },
            })
        end,
    },
}