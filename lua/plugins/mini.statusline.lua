return {
    "echasnovski/mini.statusline",
    version = false,
    config = function()
        vim.api.nvim_set_hl(0, 'MiniStatuslineToolbox', {
            fg = "#f0f0f0",
            bg = "#4f4f4f",
        })
        local toolbox_name = function()
            local toolbox_env_file = "/run/.containerenv"
            if vim.fn.filereadable(toolbox_env_file) == 1 then
                local file = io.open(toolbox_env_file, "r")
                local toolbox_name = "No env"
                for line in file:lines() do
                    if line:find('name="') then
                        toolbox_name = line:match('name="([^"]+)"')
                        break
                    end
                end
                file:close()
                return toolbox_name
            else
                return "No env"
            end
        end

        local mode_indicator = function()
            local mode = vim.fn.mode()
            if mode == "n" then
                return "N"
            elseif mode == "i" then
                return "I"
            elseif mode == "v" or mode == "V" then
                return "V"
            elseif mode == "c" then
                return "C"
            elseif mode == "R" then
                return "R"
            else
                return mode
            end
        end

        local git_status = function()
            local git_branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null")
            local git_status = vim.fn.system("git status --porcelain 2>/dev/null")
            git_branch = vim.trim(git_branch)
            git_status = vim.trim(git_status)

            if git_branch == "" then
                return ""
            end

            local git_indicator = " " .. git_branch

            local changes = {}
            local behind = false
            local modified = false
            local untracked = false

            for line in git_status:gmatch("[^\n]+") do
                local status = line:sub(1, 2)
                if status == "A " then
                    table.insert(changes, "A")
                elseif status == "M " then
                    table.insert(changes, "M")
                    modified = true
                elseif status == "D " then
                    table.insert(changes, "D")
                elseif status == "??" then
                    table.insert(changes, "??")
                    untracked = true
                end
            end

            if #changes == 0 then
                return git_indicator .. " ✅"
            end

            local change_text = table.concat(changes, ", ")
            if modified then
                return git_indicator .. " 🐾" .. " (" .. change_text .. ")"
            elseif untracked then
                return git_indicator .. " 🔧" .. " (" .. change_text .. ")"
            else
                return git_indicator .. " ⚡" .. " (" .. change_text .. ")"
            end
        end

        local active_statusline = function()
            local mode = mode_indicator()
            local toolbox = toolbox_name()
            local git_info = git_status()
            local file_path = vim.fn.expand("%:p")
            return MiniStatusline.combine_groups({
                { hl = 'MiniStatuslineModeNormal', strings = { mode } },
                { hl = 'MiniStatuslineToolbox', strings = { toolbox } },
                '%=',
                { hl = 'MiniStatuslineFilepath', strings = { file_path } },
                '%=',
                { hl = 'MiniStatuslineGitStatus', strings = { git_info } },
                { hl = 'MiniStatuslineFileinfo', strings = { "%p%%" } },
            })
        end
        require("mini.statusline").setup({
            content = {
                active = active_statusline,
                inactive = nil,
            },
        })
    end,
}

