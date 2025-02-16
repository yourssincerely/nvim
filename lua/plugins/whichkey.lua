return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
	    {
		"<leader>s",
		function()
			require("which-key").show({ global = false })
		end,
		desc = "Telescope [s]earch",
            },
	    {
		"<leader>g",
		function()
			require("which-key").show({ global = false })
		end,
		desc = "[g]it commands",
            },
        },
    }
}
