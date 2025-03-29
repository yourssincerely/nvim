-- Clipboard
vim.schedule(function()
    vim.opt.clipboard = "unnamedplus"
end)
-- Format on save
-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
    end,
})
