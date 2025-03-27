-- Clipboard
vim.schedule(function()
    vim.opt.clipboard = "unnamedplus"
end)
-- Prettyfies on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})
-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
    end,
})
