vim.schedule(function()
    vim.opt.clipboard = "unnamedplus"
end)

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})
