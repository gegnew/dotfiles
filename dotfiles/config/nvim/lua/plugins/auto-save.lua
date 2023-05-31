return function()
    require("auto-save").setup({
        enabled = false,
        condition = function(buf)
            local fn = vim.fn
            local utils = require("auto-save.utils.data")

            if fn.getbufvar(buf, "&modifiable") == 1
                and utils.not_in(fn.getbufvar(buf, "&filetype"), {
                    "sql",
                    "dbout",
                    "dbui",
                })
            then
                return true -- met condition(s), can save
            end
            return false -- can't save
        end,
        write_all_buffers = false,
    })
end
