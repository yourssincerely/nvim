return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "pyright",
                    "html",
                    "lua_ls",
                    "yamlls",
                    "terraformls",
                },
                automatic_installation = true,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("lspconfig").pyright.setup({})
            require("lspconfig").html.setup({})
            require("lspconfig").lua_ls.setup({})
            require("lspconfig").yamlls.setup({})
            require("lspconfig").terraformls.setup({})
        end,
    },
}
