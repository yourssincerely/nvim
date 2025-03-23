-- Normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- mini.completion
local imap_expr = function(lhs, rhs)
    vim.keymap.set('i', lhs, rhs, { expr = true })
end
imap_expr('<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
imap_expr('<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])
-- mini.pick
vim.api.nvim_set_keymap('n', '<Leader>p', ':lua require("mini.pick").start()<CR>', { noremap = true, silent = true })
-- Buffers
vim.keymap.set("n", "<leader>bn", ":enew<CR>", { desc = "[b]uffer [n]ew" })
vim.keymap.set("n", "<leader>bd", function()
    local buf = vim.fn.bufnr("%")
    local confirm = vim.fn.input("Delete buffer " .. buf .. "? (y/n): ")
    if confirm == "y" then
        vim.cmd("bdelete")
    end
end, { desc = "[b]uffer [d]elete" })
vim.keymap.set("n", "<A-h>", ":bprevious<CR>", { desc = "Previous buffer]" })
vim.keymap.set("n", "<A-l>", ":bnext<CR>", { desc = "Next buffer" })
---- Motions
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
