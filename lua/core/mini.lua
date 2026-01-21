require("mini.ai").setup()
require("mini.comment").setup()
require("mini.pairs").setup()
require("mini.align").setup()
require("mini.completion").setup()
require("mini.operators").setup()
require("mini.surround").setup()
require("mini.snippets").setup()
require("mini.diff").setup()
require("mini.git").setup()
require("mini.cursorword").setup()
require("mini.icons").setup()
require("mini.notify").setup()
require("mini.statusline").setup()
require("mini.trailspace").setup()
require("mini.starter").setup()
require("mini.deps").setup()
require("mini.cmdline").setup()
require("mini.pick").setup()
require("mini.files").setup()
require("mini.hipatterns").setup()
require("mini.clue").setup({
    triggers = {
        { mode = "n", keys = "<Leader>" },
        { mode = "n", keys = "b" },
        { mode = "n", keys = "s" },
    },

    clues = {
        -- Buffers
        { mode = "n", keys = "<leader>b", desc = "[b]uffers" },
        { mode = "n", keys = "<leader>bl", desc = "[b]uffer [l]ist" },
        { mode = "n", keys = "<leader>bc", desc = "[b]uffer [c]reate" },
        { mode = "n", keys = "<leader>bd", desc = "[b]uffer [d]elete" },
        { mode = "n", keys = "<leader>bD", desc = "[b]uffer [D]elete all others" },
        { mode = "n", keys = "<leader>bn", desc = "[b]uffer [n]ext" },
        { mode = "n", keys = "<leader>bp", desc = "[b]uffer [p]revious" },

        -- Search
        { mode = "n", keys = "<leader>s", desc = "[s]earch" },
        { mode = "n", keys = "<leader>sf", desc = "[s]earch [f]iles" },
        { mode = "n", keys = "<leader>sg", desc = "[s]earch [g]it" },
        { mode = "n", keys = "<leader>sw", desc = "[s]earch [w]ord" },
        { mode = "n", keys = "<leader>sb", desc = "[s]earch [b]uffers" },
    },

    window = {
        delay = 100,
    },
})
