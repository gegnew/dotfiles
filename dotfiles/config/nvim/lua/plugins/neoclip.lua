return function()
  require('neoclip').setup({
      history = 1000,
      filter = nil,
      preview = true,
      default_register = '"',
      content_spec_column = false,
      on_paste = {
        set_reg = false,
      },
      keys = {
        telescope = {
          i = {
            select = '<cr>',
            paste = '<c-v>',
            paste_behind = '<c-k>',
          },
          n = {
            select = '<cr>',
            paste = 'p',
            paste_behind = 'P',
          },
        }
      },
    })
  -- require('telescope').load_extension('neoclip')
  -- vim.api.nvim_set_keymap('n', '<leader>fl', [[<cmd>lua require('telescope').extensions.neoclip.default()<cr>]], { noremap = true, silent = true })

end
