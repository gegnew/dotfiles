return function()
  local actions = require('telescope.actions')
  require('telescope').setup{
    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
        }
    },
    defaults = {
      -- file_ignore_patterns = {"node_modules", "env"},
      mappings = {
        i = {
          ["<esc>"] = actions.close,
        },
      }
    }
  }
  vim.api.nvim_set_keymap('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown())<cr>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown())<cr>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>fr', [[<cmd>lua require('telescope.builtin').oldfiles(require('telescope.themes').get_dropdown())<cr>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>fm', [[<cmd>lua require('telescope.builtin').marks(require('telescope.themes').get_dropdown())<cr>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>fl', [[<cmd>lua require('telescope.builtin').help_tags(require('telescope.themes').get_dropdown())<cr>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown())<cr>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>ft', [[<cmd>lua require('telescope.builtin').tags(require('telescope.themes').get_dropdown())<cr>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').current_buffer_tags(require('telescope.themes').get_dropdown())<cr>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>f/', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown())<cr>]], { noremap = true, silent = true })

  require('telescope').load_extension('fzy_native')
end
