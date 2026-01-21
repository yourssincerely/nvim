-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Visual mode
vim.keymap.set("v", "<Leader>c", function()
    local start_line = vim.fn.line("v") -- start of visual selection
    local end_line = vim.fn.line(".")   -- end of visual selection (cursor)

    -- Ensure start_line <= end_line
    if start_line > end_line then
        start_line, end_line = end_line, start_line
    end

    require("mini.comment").toggle_lines(start_line, end_line)
end, { desc = "Toggle comment" })

-- ===== Normal mode =====
-- ======= Default =======
-- List buffers
vim.keymap.set("n", "<leader>bl", ":ls<CR>", { desc = "List buffers" })

-- Create new buffer
vim.keymap.set("n", "<leader>bc", ":enew<CR>", { desc = "New buffer" })

-- Delete buffer
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

-- Delete all buffers but current
vim.keymap.set("n", "<leader>bD", function()
  local current = vim.api.nvim_get_current_buf()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if buf ~= current and vim.api.nvim_buf_is_loaded(buf) then
      vim.api.nvim_buf_delete(buf, {})
    end
  end
end, { desc = "Delete all buffers except current" })

-- Next / previous buffer
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })

-- ======== Pick =========
-- Leader + sf -> pick a file in current directory
map("n", "<Leader>sf", function()
    require("mini.pick").start({
        source = { items = vim.fn.readdir('.') },
        prompt = "Pick file: ",
        filter = true,
        sort = true,
        multiple = false,
        on_choice = function(choice)
            if choice then
                vim.cmd("edit " .. choice)
            end
        end,
    })
end, { desc = "Pick file in current directory" })

-- Leader + sg -> pick a file tracked by git
map("n", "<Leader>sg", function()
    require("mini.pick").builtin.files({ tool = "git" })
end, { desc = "Pick git-tracked file" })

-- Leader + sb -> pick a buffer
vim.keymap.set("n", "<leader>sb", function()
  require("mini.pick").builtin.buffers()
end, { desc = "Buffers" })

-- Leader + bs -> Search buffers
vim.keymap.set("n", "<leader>sb", function()
  require("mini.pick").builtin.buffers()
end, { desc = "Buffers" })

-- Leader + sw -> look up a word
vim.keymap.set("n", "<Leader>sw", function()
    vim.cmd("Pick grep pattern=''")
end, { desc = "Grep a word with mini.pick" })
