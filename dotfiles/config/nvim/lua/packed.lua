local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]
vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require('packer').startup(
  function()
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/completion-nvim'
    -- use 'hrsh7th/nvim-compe'
    use {'nvim-treesitter/nvim-treesitter', config = require 'plugins.treesitter'}
    use {'ludovicchabant/vim-gutentags', config=require'plugins.vim-gutentags'}
    use {
      'neovim/nvim-lspconfig',
      -- config = require('plugins.lsp'),
      -- requires = {
      --   {
      --     'ms-jpq/coq_nvim', branch = 'coq',
      --     config=require'plugins.coq-config'
      --   },
      --   {'ms-jpq/coq.artifacts', branch = 'artifacts'},
      -- },
    }
    use 'williamboman/nvim-lsp-installer'

    -- fuzzy finder
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
      config=require'plugins.nvim-telescope'
    }
    use {
      'nvim-telescope/telescope-fzy-native.nvim'
    }
    use {
      'tjdevries/complextras.nvim',
      config=require'plugins.complextras'
    }

    use {
        "AckslD/nvim-neoclip.lua",
        config = require('plugins.neoclip')
    }

    use {
        "Pocco81/AutoSave.nvim",
        config = require('plugins.AutoSave')
    }

    use {
      'glacambre/firenvim',
      run = function() vim.fn['firenvim#install'](0) end,
      config = require('plugins.firenvim')
    }
  end
)
