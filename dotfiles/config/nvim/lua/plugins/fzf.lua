return function()
  local actions = require('fzf-lua.actions')
  require('fzf-lua').setup{
  }
  vim.api.nvim_set_keymap('n', '<leader>ff', "<cmd>lua require('fzf-lua').files()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>fo', "<cmd>lua require('fzf-lua').oldfiles()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>fq', "<cmd>lua require('fzf-lua').quickfix()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>fb', "<cmd>lua require('fzf-lua').buffers()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>fg', "<cmd>lua require('fzf-lua').grep()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>fv', "<cmd>lua require('fzf-lua').git_files()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>ft', "<cmd>lua require('fzf-lua').buffer_tags()<CR>", { noremap = true, silent = true })
end
