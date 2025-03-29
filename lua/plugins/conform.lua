return {
    "stevearc/conform.nvim",
    version = false,
    config = function()
        require("conform").setup({
                formatters_by_ft = {
                lua = { "stylua " },
                python = { "isort", "black" },
                terraform = { "terraform_fmt" },
                yaml = { "ansible-lint" },
            },
            format_on_save = {
                timeout_ms = 5000,
                lsp_fallback = true,
            },
        })
    end,
}
