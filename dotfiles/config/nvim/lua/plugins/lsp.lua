return function()
  -- local uv = vim.loop
  -- local capabilities = vim.lsp.protocol.make_client_capabilities()
  local lspconfig = require('lspconfig')
  -- local coq = require('coq')
  -- local configs = require'lspconfig/configs'
  -- capabilities.textDocument.completion.completionItem.snippetSupport = true

  local on_attach = function(client, bufnr)
  --   -- completion.on_attach(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }

  --   -- Keybindings for LSPs
    vim.api.nvim_set_keymap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<leader>ge", "<cmd>lua vim.lsp.buf.declaration()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<leader>gf", "<cmd>lua vim.lsp.buf.formatting()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<leader>gy", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<leader>gt", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<leader>gw", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<leader>gn", "<cmd>lua vim.lsp.buf.rename()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    vim.api.nvim_set_keymap('n', '[g', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_set_keymap('n', ']g', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    -- vim.api.nvim_command('setlocal omnifunc=v:lua.vim.lsp.omnifunc')
  end


  -- Use a loop to conveniently call 'setup' on multiple servers and
  -- map buffer local keybindings when the language server attaches
  local servers = { 'pyright' }
  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      }
    }
  end

  -- lspconfig.pyright.setup{coq.lsp_ensure_capabilities()} -- is this necessary?



  -- lspconfig.bashls.setup { on_attach = on_attach }

  -- -- lspconfig.jedi_language_server.setup{
  -- --   on_attach=on_attach,
  -- --   init_options = {
  -- --     disableSnippets = false,
  -- --   },
  -- --   capabilities = {
  -- --      textDocument = {
  -- --        completion = {
  -- --         completionItem = {
  -- --           snippetSupport=true
  -- --         }
  -- --        }
  -- --      }
  -- --   },
  -- -- }

  -- -- require'lspconfig'.pyls.setup{
  -- --   on_attach = on_attach,
  -- -- }


  -- -- lspconfig.sumneko_lua.setup{
  -- --       cmd = { '/opt/lua-language-server/bin/Linux/lua-language-server', '-E', '/opt/lua-language-server/main.lua' }, 
  -- --       on_attach = on_attach,
  -- --       capabilities = {
  -- --         textDocument = {
  -- --           completion = {
  -- --             completionItem = {
  -- --               snippetSupport=true
  -- --             }
  -- --           }
  -- --         }
  -- --       },
  -- --       settings = {
  -- --         Lua = {
  -- --           completion= {
  -- --             keywordSnippet="Replace",
  -- --             callSnippet="Replace"
  -- --           },
  -- --           runtime = {
  -- --             -- Tell the language server which version of Lua you're using (LuaJIT in the case of Neovim)
  -- --             version = 'LuaJIT',
  -- --             -- Setup your lua path
  -- --             -- path = vim.split(package.path, ';'),
  -- --           },
  -- --           diagnostics = {
  -- --             -- Get the language server to recognize the `vim` global
  -- --             globals = {'vim', 'use', 'love'},
  -- --           },
  -- --           workspace = {
  -- --             -- Make the server aware of Neovim runtime files
  -- --             library = {
  -- --               [vim.fn.expand('$VIMRUNTIME/lua')] = true,
  -- --               [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
  -- --             },
  -- --           },
  -- --         }
  -- --   }
  -- -- }

  -- -- lspconfig.vimls.setup{
  -- --   on_attach = on_attach,
  -- -- }

  -- lspconfig.tsserver.setup{
  --   on_attach = on_attach,
  -- }

  -- lspconfig.pyright.setup{
  --   -- on_attach = on_attach,
  -- }
  -- lspconfig.pyright.setup{
  --   coq.lsp_ensure_capabilities()
  -- }



  -- lspconfig.html.setup{
  --   cmd = {"vscode-html-language-server", "--stdio"},
  --   filetypes = { "html", "htmldjango" },
  --   on_attach = on_attach,
  --   capabilities = {
  --        textDocument = {
  --            completion = {
  --                completionItem = {
  --                    snippetSupport = true
  --                }
  --            }
  --        }
  --   }
  -- }

  -- lspconfig.cssls.setup{
  --   cmd = {"vscode-css-language-server", "--stdio"},
  --   on_attach = on_attach,
  --   settings = {
  --     css = {
  --       validate = false
  --     },
  --     less = {
  --       validate = true
  --     },
  --     scss = {
  --       validate = true
  --     }
  --   },
  --   capabilities = {
  --        textDocument = {
  --            completion = {
  --                completionItem = {
  --                    snippetSupport = true
  --                }
  --            }
  --        }
  --   }
  -- }

  -- -- stolen from https://github.com/fsouza/vimfiles
  -- local get_python_tool = function(bin_name)
  --   local result = bin_name
  --   if os.getenv('VIRTUAL_ENV') then
  --     local venv_bin_name = os.getenv('VIRTUAL_ENV') .. '/bin/' .. bin_name
  --     if vim.fn.executable(venv_bin_name) == 1 then
  --       result = venv_bin_name
  --     end
  --   end
  --   return result
  -- end

  -- local function get_node_modules(root_dir)
  --   -- util.find_node_modules_ancestor()
  --   local root_node = root_dir .. "/node_modules"
  --   local stats = uv.fs_stat(root_node)
  --   if stats == nil then
  --     return nil
  --   else
  --     return root_node
  --   end
  -- end

  -- local default_node_modules = get_node_modules(vim.fn.getcwd())

  -- local ngls_cmd = {
  --   "ngserver",
  --   "--stdio",
  --   "--tsProbeLocations",
  --   default_node_modules,
  --   "--ngProbeLocations",
  --   default_node_modules
  -- }

  -- lspconfig.angularls.setup {
  --   cmd = ngls_cmd,
  --   on_attach = on_attach,
  --   capabilities = capabilities,
  --   filetypes = {'html'},
  --   on_new_config = function(new_config)
  --     new_config.cmd = ngls_cmd
  --   end
  -- }

  -- lspconfig.vuels.setup{
  --   on_attach = on_attach
  -- }

end
