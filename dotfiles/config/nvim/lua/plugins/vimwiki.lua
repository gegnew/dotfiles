local M = {}

function M.setup()
    -- require("vimwiki").setup()

    vim.api.nvim_exec(
        [[
        let g:vimwiki_list = [{'path': '~/Sync/vault',
                              \ 'syntax': 'markdown', 'ext': '.md'}]
        
        let g:GPGFilePattern = '*.\(gpg\|asc\|pgp\)\(.md\)\='

        au BufNewFile ~/Sync/vault/diary/*.md :silent 0r !~/Sync/vault/diary/template '%'
        
    ]]   ,
        false
    )
end

return M
