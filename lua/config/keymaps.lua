-- Locals
local telescope = require("telescope.builtin")
-- Normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>e", "<cmd>Ex<Cr>", { desc = "File [e]xplorer" })
-- Telescope
vim.keymap.set("n", "<leader>sf", telescope.find_files, { desc = "[s]earch [f]iles" })
vim.keymap.set("n", "<leader>sg", telescope.live_grep, { desc = "[s] live [g]rep" })
vim.keymap.set("n", "<leader>sb", telescope.buffers, { desc = "[s]earch [b]uffer" })
vim.keymap.set("n", "<leader>ss", telescope.current_buffer_fuzzy_find, { desc = "[s]earch [s]ame buffer" })
vim.keymap.set("n", "<leader>sc", telescope.commands, { desc = "[s]earch [c]ommands" })
vim.keymap.set("n", "<leader>sr", telescope.oldfiles, { desc = "[s]earch [r]ecent files" })
vim.keymap.set("n", "<leader>gs", telescope.git_status, { desc = "[g]it [s]tatus" })
vim.keymap.set("n", "<leader>gc", telescope.git_commits, { desc = "[g]it [c]ommits" })
---- Motions
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
