-- Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  vim.cmd([[packadd packer.nvim]])
end

-- stylua: ignore start
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager
  use 'tpope/vim-fugitive'     -- Git commands in nvim

  use 'simnalamburt/vim-mundo'

  use 'WhoIsSethDaniel/mason-tool-installer.nvim'

  use({
    "pwntester/octo.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("octo").setup()
    end,
  })

  use "whiteinge/diffconflicts" -- configure git like: https://github.com/whiteinge/diffconflicts#installation
  use 'tpope/vim-rhubarb'       -- Fugitive-companion to interact with github

  use 'machakann/vim-swap'
  use {
    'andymass/vim-matchup',
    setup = function()
      -- may set any options here
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end
  }
  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup {
        current_line_blame = true,
        current_line_blame_opts = {
          virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
          delay = 400,
        },
      }
    end
  }

  use 'numToStr/Comment.nvim'           -- "gc" to comment visual regions/lines
  use 'nvim-treesitter/nvim-treesitter' -- Highlight, edit, and navigate code
  use {
    'voldikss/vim-floaterm',
    config = function()
      vim.g.floaterm_opener = 'vsplit'
    end
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects' -- Additional textobjects for treesitter
  use {
    'neovim/nvim-lspconfig',
    opt = true,
    event = { "BufReadPre" },
    wants = {
      "mason.nvim",
      "mason-lspconfig.nvim",
      "mason-tool-installer.nvim",
      "null-ls.nvim",
      "typescript.nvim",
    },
    config = function()
      require("plugins.lspconfig")
    end,
    requires = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "jose-elias-alvarez/null-ls.nvim",
      "jose-elias-alvarez/typescript.nvim",
    }
  }                                       -- Collection of configurations for built-in LSP client
  use 'williamboman/mason.nvim'           -- Manage external editor tooling i.e LSP servers
  use 'williamboman/mason-lspconfig.nvim' -- Automatically install language servers to stdpath
  use {
    'hrsh7th/nvim-cmp', requires = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'onsails/lspkind-nvim',
    "saadparwaiz1/cmp_luasnip",
    {
      "L3MON4D3/LuaSnip",
      requires = { "rafamadriz/friendly-snippets", "honza/vim-snippets" },
      config = function()
        require("plugins.snip").setup()
      end,
    },
    -- "rafamadriz/friendly-snippets",
    -- "honza/vim-snippets",
  }
  }

  use 'folke/tokyonight.nvim'
  use 'mjlbach/onedark.nvim'                -- Theme inspired by Atom
  use 'nvim-lualine/lualine.nvim'           -- Fancier statusline
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  use 'tpope/vim-sleuth'                    -- Detect tabstop and shiftwidth automatically

  use {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup {
        mapping = { "jk", "jj" },
      }
    end,
  }

  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require "plugins.null-ls"
    end
  }

  --------------------------
  -------Look & Feel--------
  --------------------------
  -- use { "vimwiki/vimwiki",
  --   config = function()
  --     require("plugins.vimwiki").setup()
  --   end,
  -- }

  use {
    "nvim-neorg/neorg",
    run = ":Neorg sync-parsers",
    config = function()
      require("plugins.neorg").setup()
    end,
    requires = {
      { "pysan3/neorg-templates", "L3MON4D3/LuaSnip" },
    },
  }

  use {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end,
    config = function()
      vim.cmd 'let g:firenvim_config = { "globalSettings": { "alt": "all", }, "localSettings": { ".*": { "cmdline": "neovim", "content": "text", "priority": 0, "selector": "textarea", "takeover": "never", }, } }'
    end
  }

  use 'tpope/vim-speeddating'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-abolish'
  use 'tpope/vim-vinegar'
  use 'tpope/vim-apathy'
  use 'tpope/vim-repeat'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-surround'
  use "elihunter173/dirbuf.nvim"

  use 'simeji/winresizer'

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('plugins.telescope').setup() end
  }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable "make" == 1 }

  use { 'petobens/poet-v' }

  -- mine:
  use { "alexghergh/nvim-tmux-navigation",
    config = function() require('plugins.tmux-nav').setup() end
  }
  use { "~/Desktop/misc/roast.vim" }

  use { "kevinhwang91/nvim-ufo",
    -- opt = true,
    -- event = { "BufRead" },
    wants = { "promise-async" },
    requires = "kevinhwang91/promise-async",
    config = function()
      vim.opt.foldcolumn = '1'
      vim.opt.foldlevel = 99 -- Using ufo provider need a large value
      vim.opt.foldlevelstart = 99
      vim.opt.foldenable = true

      require("ufo").setup {
        provider_selector = function(bufnr, filetype, buftype)
          return { 'treesitter', 'indent' }
          -- return { "lsp", "treesitter", "indent" }
        end,
      }
      vim.keymap.set("n", "zR", require("ufo").openAllFolds)
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
    end,
  }

  use 'ojroques/nvim-bufdel'

  use {
    'folke/which-key.nvim',
    config = function() require('plugins.which-key').setup() end
  }

  use { "NvChad/base46",
    config = function()
      local ok, base46 = pcall(require, "base46")

      if ok then
        base46.load_theme()
      end
    end,
  }

  use { "NvChad/ui",
    after = "base46",
    config = function()
      local present, nvchad_ui = pcall(require, "nvchad_ui")

      if present then
        nvchad_ui.setup()
      end
    end,
  }

  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-neotest/neotest-python",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim"
    },
    config = function()
      require("plugins.neotest").setup()
    end,
  }

  -- use {
  --   "NTBBloodbath/rest.nvim",
  --   config = function()
  --     require("rest-nvim").setup {}
  --     vim.keymap.set("n", "<CR>", "<Plug>RestNvim", { noremap = true, silent = true })
  --     -- vim.keymap.set("n", "<C-i>", "<Plug>RestNvimPreview", { noremap = true, silent = true })
  --   end
  -- }

  use {
    "chipsenkbeil/distant.nvim",
    config = function()
      require("distant").setup {
        ["*"] = require("distant.settings").chip_default(),
      }
    end,
  }

  use {
    'romgrk/barbar.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  use {
    "Pocco81/auto-save.nvim",
    config = function()
      require "plugins.auto-save"
    end
  }

  use {
    "tpope/vim-dadbod",
    opt = true,
    requires = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
    },
    config = function()
      require("plugins.dadbod").setup()
    end,
    cmd = { "DBUIToggle", "DBUI", "DBUIAddConnection", "DBUIFindBuffer", "DBUIRenameBuffer", "DBUILastQueryInfo" },
  }
  use {
    "abecodes/tabout.nvim",
    wants = { "nvim-treesitter" },
    after = { "nvim-cmp" },
    config = function()
      require("tabout").setup {
        completion = false,
        ignore_beginning = true,
      }
    end,
  }

  use "onsails/lspkind-nvim"

  if is_bootstrap then
    require('packer').sync()
  end
end)
-- stylua: ignore end

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print("==================================")
  print("    Plugins are being installed")
  print("    Wait until Packer completes,")
  print("       then restart nvim")
  print("==================================")
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  command = "source <afile> | PackerCompile",
  group = packer_group,
  pattern = vim.fn.expand("$MYVIMRC"),
})

-- [[ Setting options ]]
-- See `:help vim.o`

vim.o.clipboard = "unnamedplus"
-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
-- vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
vim.wo.signcolumn = "yes"

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd([[colorscheme tokyonight-night]])

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

vim.o.wrap = false
vim.o.relativenumber = true
vim.o.conceallevel = 0
vim.o.autoread = true
vim.o.scrolloff = 3
vim.o.swapfile = false
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.autochdir = false

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.netrw_bufsettings = "noma nomod nonu nowrap ro buflisted"

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- Set lualine as statusline
-- See `:help lualine.txt`
require("lualine").setup({
  options = {
    icons_enabled = false,
    theme = "onedark",
    component_separators = "|",
    section_separators = "",
  },
})

-- Enable Comment.nvim
require("Comment").setup()

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require("indent_blankline").setup({
  char = "┊",
  show_trailing_blankline_indent = false,
})

-- Gitsigns
-- See `:help gitsigns.txt`
require("gitsigns").setup({
  signs = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
  },
})

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require("nvim-treesitter.configs").setup({
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { "http", "json", "yaml", "css", "toml", "lua", "python", "rust", "tsx" },
  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<c-space>",
      node_incremental = "<c-space>",
      -- TODO: I'm not sure for this one.
      scope_incremental = "<c-s>",
      node_decremental = "<c-backspace>",
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
  },
  matchup = {
    enable = true,
  },
})

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- vim.diagnostic.config({
--   virtual_text = false,
--   signs = true,
--   underline = true,
--   update_in_insert = false,
--   float = { border = "rounded" },
--   severity_sort = false,
-- })

-- Setup mason so it can manage external tooling
require("mason").setup()

-- Enable the following language servers
local ensure_installed = {
  -- "isort",
  -- "black",
  "pyright",
  -- "pylsp",
  -- "pyre",
  -- "flake8",
  "tsserver",
  "lua_ls",
  -- "prettierd",
  -- "stylelua",
  -- "write_good",
  -- "shfmt",
  -- "shellcheck",
  -- "fixjson",
  -- "tsc",
  -- "dictionary",
  -- "gitrebase",
  -- "gitsigns",
  -- "actionlint",
}

-- Ensure the servers above are installed
require("mason-lspconfig").setup({
  ensure_installed = ensure_installed,
})

-- require("mason-tool-installer").setup({
--   ensure_installed = {
--     -- "lua-language-server",
--     -- "vim-language-server",
--     -- "stylua",
--     -- "shellcheck",
--     -- "editorconfig-checker",
--     -- "json-to-struct",
--     -- "luacheck",
--     -- "misspell",
--     -- "revive",
--     -- "shellcheck",
--     -- "shfmt",
--     -- "staticcheck",
--   },
-- })

-- nvim-cmp setup
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ["<C-j>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<C-k>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = {
    { name = "nvim_lsp" },
    -- vsnip seems to work but luasnip not, i guess?
    { name = 'vsnip' },
    { name = "luasnip" },
    { name = "neorg" },
  },
  formatting = {
    format = require("lspkind").cmp_format({ with_text = false, maxwidth = 50 }),
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
