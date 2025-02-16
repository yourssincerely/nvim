return {
    {
        "echasnovski/mini.comment",
        version = false,
        config = function()
            require("mini.comment").setup({
                options = {
                    ignore_blank_line = false,
                    start_of_line = false,
                    pad_comment_parts = true,
                },
                mappings = {
                    -- Toggle comment on current line
                    comment_line = "gc",
                  },
            })
        end,
    },
}
