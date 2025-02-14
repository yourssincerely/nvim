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
                    -- Normal and Visual modes
                    comment = "gc",
                    -- Toggle comment on current line
                    comment_line = "gcc",
                    -- Toggle comment on visual selection
                    comment_visual = "gc",
                    -- Works also in Visual mode if mapping differs from `comment_visual`
                    textobject = "gc",
                  },
            })
        end,
    },
}