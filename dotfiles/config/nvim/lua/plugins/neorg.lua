local neorg_dir = "/home/g/Sync/vault2"

local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

local M = {
    date_format = [[%Y-%m-%d]],
    time_format = [[%H:%M]],
}

M.parse_date = function(delta_date, str)
    local year, month, day = string.match(str, [[^(%d%d%d%d)-(%d%d)-(%d%d)$]])
    return os.date(M.date_format, os.time({ year = year, month = month, day = day }) + 86400 * delta_date)
end

M.current_date_f = function(delta_day)
    return function()
        return os.date(M.date_format, os.time() + 86400 * delta_day)
    end
end

M.prev_day_file = function(days_back)
    local yesterday = M.current_date_f(days_back or -1)()
    return neorg_dir .. "/diary/" .. yesterday .. ".norg"
end

M.file_exists = function(file)
    local f = io.open(file, "rb")
    if f then f:close() end
    return f ~= nil
end

M.lines_from = function(file)
    if not M.file_exists(file) then return {} end
    local lines = {}
    for line in io.lines(file) do
        lines[#lines + 1] = line
    end
    return lines
end

M.prev_day_todo = function()
    local prev_file
    -- go back up to 100 days for last file
    for i = -1, -100, -1 do
        prev_file = M.prev_day_file(i)
        if M.file_exists(prev_file) then
            break
        end
    end
    local content = M.lines_from(prev_file)
    local lines = {}
    for k, line in pairs(content) do
        if line:find("%- %( %)") then
            lines[#lines + 1] = line
        end
        -- lines[#lines + 1] = string.match(line, "Write (%S+)")
    end
    return lines
end

function M.setup()
    -- auto run the template for a new file
    vim.api.nvim_create_autocmd("BufNewFile", {
        command = "Neorg templates journal",
        pattern = { "/home/g/Sync/vault2/diary/*.norg" },
        -- pattern = { neorg_dir .. "diary/*.norg" },
    })

    require('neorg').setup {
        load = {
            ["core.defaults"] = {},
            ["core.qol.toc"] = {},
            ["core.qol.todo_items"] = {},
            ["core.looking-glass"] = {},
            ["core.journal"] = {
                config = {
                    journal_folder = "diary",
                    strategy = "flat",
                }
            },
            ["core.dirman"] = {
                config = {
                    workspaces = {
                        vault = neorg_dir
                    },
                    default_workspace = "vault",
                    index = "index.norg"
                }
            },
            ["core.clipboard.code-blocks"] = {},
            ["core.keybinds"] = { config = {} },
            ["core.esupports.hop"] = {},
            ["core.esupports.metagen"] = {},
            ["core.esupports.indent"] = {},
            ["core.concealer"] = {},
            ["core.completion"] = {
                config = { engine = "nvim-cmp" },
            },
            ["external.templates"] = {
                config = {
                    templates_dir = neorg_dir .. "/templates",
                    keywords = {
                        TODO = f(M.prev_day_todo),
                    }
                }
            }
        }
    }
end

return M
