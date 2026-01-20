-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

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
-- Leader + sf → pick a file in current directory
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

-- Leader + sg → pick a file tracked by git
map("n", "<Leader>sg", function()
    require("mini.pick").builtin.files({ tool = "git" })
end, { desc = "Pick git-tracked file" })

-- Leader + sw → Look up a word
vim.keymap.set("n", "<Leader>sw", function()
    -- Run MiniPick grep with the keyword
    vim.cmd("Pick grep pattern=''")
end, { desc = "Grep a word with mini.pick" })
