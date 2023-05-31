local M = {}

local whichkey = require("which-key")
local hop = require("hop")
local directions = require("hop.hint").HintDirection

local opts = {
  mode = "n", -- Normal mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

M.general = {
  -- ["<leader><leader>"] = { "<cmd>lua require('telescope').extensions.frecency.frecency()<CR>", "Find frecency" },

  ["<leader>r"] = { "<cmd>FloatermNew xplr <CR>", "Open xplr" },

  ["[d"] = { vim.diagnostic.goto_prev, "Previous diagnostic" },
  ["]d"] = { vim.diagnostic.goto_nex, "Next diagnostic" },

  ["]b"] = { "<cmd>BufferNext<CR>", "Next buffer" },
  ["[b"] = { "<cmd>BufferPrevious<CR>", "Previous buffer" },
  ["<C-n>"] = { "<cmd>BufferNext<CR>", "Next buffer" },
  ["<C-p>"] = { "<cmd>BufferPrevious<CR>", "Previous buffer" },
  ["<leader>["] = { "<cmd>BufferPick<CR>", "Pick buffer" },

  ["]c"] = { "<cmd>Gitsigns next_hunk<CR>", " Go to next hunk" },
  ["[c"] = { "<cmd>Gitsigns prev_hunk<CR>", " Go to prev hunk" },

  -- ["<leader>e"], vim.diagnostic.open_float)
  -- ["<leader>q"], vim.diagnostic.setloclist)
  ["gr"] = { require("telescope.builtin").lsp_references, "LSP referennces" },
  ["<leader>ds"] = { require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols" },
  ["<leader>ws"] = { require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols" },

  -- ["f"] = {
  --   hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true }),
  --   "f",
  -- },
  -- ["F"] = {
  --   hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true }),
  --   "F",
  -- },
  -- ["t"] = {
  --   hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }),
  --   "t",
  -- },
  -- ["T"] = {
  --   hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }),
  --   "T",
  -- },
}

local function normal_keymap()
  local tb = require("telescope.builtin")
  local keymap = {

    b = {
      b = { "<cmd>BufferClose<CR>", "Delete buffers" },
      d = { "<cmd>BufferCloseAllButVisible<CR>", "Delete buffers" },
    },
    -- Git
    g = {
      d = { "<cmd>Gvdiff<CR>" },
    },

    f = {
      name = "Find",
      f = { tb.find_files, "Files" },
      b = { tb.buffers, "Buffers" },
      o = { tb.oldfiles, "Recently opened files" },
      a = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "All files" },
      d = { tb.diagnostics, "Diagnostics" },

      h = { tb.help_tags, "Help" },
      ["'"] = { tb.marks, "Marks" },
      g = { tb.live_grep, "Live Grep" },
      s = { tb.grep_string, "[S]earch current word" },
      c = { tb.commands, "Commands" },
      r = { "<cmd>lua require'telescope'.extensions.file_browser.file_browser()<cr>", "File Browser" },
      ["/"] = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", "Current Buffer" },
      e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
      -- vim.keymap.set("n", "<leader>/", function()
      --   -- You can pass additional configuration to telescope to change theme, layout, etc.
      --   require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
      --     winblend = 10,
      --     previewer = false,
      --   }))
    },

    t = {
      name = "Neotest",
      a = { "<cmd>lua require('neotest').run.attach()<cr>", "Attach" },
      f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run File" },
      F = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Debug File" },
      l = { "<cmd>lua require('neotest').run.run_last()<cr>", "Run Last" },
      L = { "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>", "Debug Last" },
      n = { "<cmd>lua require('neotest').run.run()<cr>", "Run Nearest" },
      N = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Debug Nearest" },
      o = { "<cmd>lua require('neotest').output.open({ enter = true })<cr>", "Output" },
      S = { "<cmd>lua require('neotest').run.stop()<cr>", "Stop" },
      s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Summary" },
    },

    -- r = {
    --   name = "Rest",
    -- }

    -- Gitsigns ("hunk")
    h = {
      s = { ":Gitsigns stage_hunk<CR>", " Stage hunk" },
      r = { ":Gitsigns reset_hunk<CR>", " Reset hunk" },
      u = { ":Gitsigns undo_stage_hunk<CR>", " Undo stage hunk" },
      p = { ":Gitsigns preview_hunk<CR>", " Preview hunk" },
      B = { ":Gitsigns stage_buffer<CR>", " Stage buffer" },
      R = { ":Gitsigns reset_buffer<CR>", " Reset buffer" },
      d = { ":Gitsigns diffthis<CR>", " Diff buffer" },
      -- D = { function() gs.diffthis('~') end, " Diff this ~" },
      b = { ":Gitsigns toggle_current_line_blame<CR>", " Toggle blame" },
    },

    -- Vimwiki, mostly, plus some whichkey
    w = {
      w = { "<cmd>Neorg index<CR>", "Go to neorg vault index" },
      n = { "<cmd>Neorg journal today<CR>", "make diary note, today" },
      t = { "<cmd>Neorg journal tomorrow<CR>", "make diary entry, tomorrow" },
      y = { "<cmd>Neorg journal yesterday<CR>", "make vimwiki diary entry, yesterday" },
      -- n = { "<cmd>VimwikiMakeDiaryNote<CR>", "make vimwiki diary note, today" },
      -- t = { "<cmd>VimwikiMakeTomorrowDiaryNote<CR>", "make vimwiki diary entry, tomorrow" },
      -- y = { "<cmd>VimwikiMakeYesterdayDiaryNote<CR>", "make vimwiki diary entry, yesterday" },
      -- g = { "<cmd>VimwikiDiaryGenerateLinks<CR>", "generate vimwiki links" },
    },
  }
  whichkey.register(keymap, opts)
end

M.lspconfig = {
  ["gD"] = {
    function()
      vim.lsp.buf.declaration()
    end,
    "lsp declaration",
  },

  ["gd"] = {
    function()
      vim.lsp.buf.definition()
    end,
    "lsp definition",
  },

  ["K"] = {
    function()
      vim.lsp.buf.hover()
    end,
    "lsp hover",
  },

  ["gi"] = {
    function()
      vim.lsp.buf.implementation()
    end,
    "lsp implementation",
  },

  ["<leader>ls"] = {
    function()
      vim.lsp.buf.signature_help()
    end,
    "lsp signature_help",
  },

  ["<leader>D"] = {
    function()
      vim.lsp.buf.type_definition()
    end,
    "lsp definition type",
  },

  ["<leader>ra"] = {
    function()
      require("nvchad_ui.renamer").open()
    end,
    "lsp rename",
  },

  ["<leader>ca"] = {
    function()
      vim.lsp.buf.code_action()
    end,
    "lsp code_action",
  },

  ["gr"] = {
    function()
      vim.lsp.buf.references()
    end,
    "lsp references",
  },

  ["<leader>f"] = {
    function()
      vim.diagnostic.open_float()
    end,
    "floating diagnostic",
  },

  ["[d"] = {
    function()
      vim.diagnostic.goto_prev()
    end,
    "goto prev",
  },

  ["d]"] = {
    function()
      vim.diagnostic.goto_next()
    end,
    "goto_next",
  },

  ["<leader>q"] = {
    function()
      vim.diagnostic.setloclist()
    end,
    "diagnostic setloclist",
  },

  ["<leader>fm"] = {
    function()
      vim.lsp.buf.format({ async = true })
    end,
    "lsp formatting",
  },

  ["<leader>wa"] = {
    function()
      vim.lsp.buf.add_workspace_folder()
    end,
    "add workspace folder",
  },

  ["<leader>wr"] = {
    function()
      vim.lsp.buf.remove_workspace_folder()
    end,
    "remove workspace folder",
  },

  ["<leader>wl"] = {
    function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end,
    "list workspace folders",
  },
}

M.terminal = {}

function M.setup()
  whichkey.register(M.general)
  whichkey.register(M.lspconfig)
  normal_keymap()
  -- visual_keymap()
  -- code_keymap()
end

return M
