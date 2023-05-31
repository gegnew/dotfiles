-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/g/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/g/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/g/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/g/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/g/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["AutoSave.nvim"] = {
    config = { "\27LJ\2\n†\3\0\0\b\0\17\0\0236\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0'\4\4\0006\5\5\0009\5\6\0059\5\a\5'\a\b\0B\5\2\2&\4\5\4=\4\t\0035\4\n\0=\4\v\0035\4\f\0004\5\0\0=\5\r\0045\5\14\0=\5\15\4=\4\16\3B\1\2\1K\0\1\0\15conditions\20filetype_is_not\1\2\0\0\bsql\20filename_is_not\1\0\2\vexists\2\15modifiable\2\vevents\1\3\0\0\16InsertLeave\16TextChanged\22execution_message\r%H:%M:%S\rstrftime\afn\bvim\24AutoSave: saved at \1\0\5\19debounce_delay\3‡\1 clean_command_line_interval\3\0\22write_all_buffers\1\20on_off_commands\2\fenabled\2\nsetup\rautosave\frequire\0" },
    loaded = true,
    path = "/home/g/.local/share/nvim/site/pack/packer/start/AutoSave.nvim",
    url = "https://github.com/Pocco81/AutoSave.nvim"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "/home/g/.local/share/nvim/site/pack/packer/start/completion-nvim",
    url = "https://github.com/nvim-lua/completion-nvim"
  },
  ["complextras.nvim"] = {
    config = { "\27LJ\2\n|\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0]inoremap <c-x><c-d> <c-r>=luaeval(\"require('complextras').complete_line_from_cwd()\")<CR>\bcmd\bvim\0" },
    loaded = true,
    path = "/home/g/.local/share/nvim/site/pack/packer/start/complextras.nvim",
    url = "https://github.com/tjdevries/complextras.nvim"
  },
  firenvim = {
    config = { "\27LJ\2\né\1\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0É\1let g:firenvim_config = { \"globalSettings\": { \"alt\": \"all\", }, \"localSettings\": { \".*\": { \"cmdline\": \"neovim\", \"content\": \"text\", \"priority\": 0, \"selector\": \"textarea\", \"takeover\": \"never\", }, } }\bcmd\bvim\0" },
    loaded = true,
    path = "/home/g/.local/share/nvim/site/pack/packer/start/firenvim",
    url = "https://github.com/glacambre/firenvim"
  },
  ["fzf-lua"] = {
    config = { "\27LJ\2\nÑ\6\0\0\a\0\29\0B6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0014\3\0\0B\1\2\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\b\0'\5\t\0005\6\n\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\v\0'\5\f\0005\6\r\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\14\0'\5\15\0005\6\16\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\17\0'\5\18\0005\6\19\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\20\0'\5\21\0005\6\22\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\23\0'\5\24\0005\6\25\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\26\0'\5\27\0005\6\28\0B\1\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\0022<cmd>lua require('fzf-lua').buffer_tags()<CR>\15<leader>ft\1\0\2\vsilent\2\fnoremap\0020<cmd>lua require('fzf-lua').git_files()<CR>\15<leader>fv\1\0\2\vsilent\2\fnoremap\2+<cmd>lua require('fzf-lua').grep()<CR>\15<leader>fg\1\0\2\vsilent\2\fnoremap\2.<cmd>lua require('fzf-lua').buffers()<CR>\15<leader>fb\1\0\2\vsilent\2\fnoremap\2/<cmd>lua require('fzf-lua').quickfix()<CR>\15<leader>fq\1\0\2\vsilent\2\fnoremap\2/<cmd>lua require('fzf-lua').oldfiles()<CR>\15<leader>fo\1\0\2\vsilent\2\fnoremap\2,<cmd>lua require('fzf-lua').files()<CR>\15<leader>ff\6n\20nvim_set_keymap\bapi\bvim\nsetup\ffzf-lua\20fzf-lua.actions\frequire\0" },
    loaded = true,
    path = "/home/g/.local/share/nvim/site/pack/packer/start/fzf-lua",
    url = "https://github.com/ibhagwan/fzf-lua"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/g/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/g/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-neoclip.lua"] = {
    config = { "\27LJ\2\n¢\2\0\0\6\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\v\0005\4\a\0005\5\6\0=\5\b\0045\5\t\0=\5\n\4=\4\f\3=\3\r\2B\0\2\1K\0\1\0\tkeys\14telescope\1\0\0\6n\1\0\3\vselect\t<cr>\npaste\6p\17paste_behind\6P\6i\1\0\0\1\0\3\vselect\t<cr>\npaste\n<c-v>\17paste_behind\n<c-k>\ron_paste\1\0\1\fset_reg\1\1\0\4\fpreview\2\fhistory\3è\a\24content_spec_column\1\21default_register\6\"\nsetup\fneoclip\frequire\0" },
    loaded = true,
    path = "/home/g/.local/share/nvim/site/pack/packer/start/nvim-neoclip.lua",
    url = "https://github.com/AckslD/nvim-neoclip.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n…\1\0\0\5\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\3B\1\2\1K\0\1\0\14highlight\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/g/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/g/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/g/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/g/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["vim-gutentags"] = {
    config = { "\27LJ\2\n¾\b\0\0\4\0\19\0-6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\1\0=\1\4\0006\0\0\0009\0\1\0005\1\6\0=\1\5\0006\0\0\0009\0\1\0006\1\0\0009\1\b\0019\1\t\1'\3\n\0B\1\2\2=\1\a\0006\0\0\0009\0\1\0+\1\2\0=\1\v\0006\0\0\0009\0\1\0+\1\2\0=\1\f\0006\0\0\0009\0\1\0+\1\2\0=\1\r\0006\0\0\0009\0\1\0+\1\2\0=\1\14\0006\0\0\0009\0\15\0'\2\16\0B\0\2\0016\0\0\0009\0\1\0005\1\18\0=\1\17\0K\0\1\0\1\3\0\0\23--tag-relative=yes\21--fields=+ailmnS\31gutentags_ctags_extra_args\\command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')\bcmd'gutentags_generate_on_empty_buffer gutentags_generate_on_write\"gutentags_generate_on_missing\30gutentags_generate_on_new\25~/.cache/nvim/ctags/\vexpand\afn\24gutentags_cache_dir\1\3\0\0\17package.json\t.git\27gutentags_project_root(gutentags_add_default_project_roots\1>\0\0\n*.git\n*.svg\t*.hg\14*/tests/*\nbuild\tdist\21*sites/*/files/*\bbin\17node_modules\21bower_components\ncache\rcompiled\tdocs\fexample\vbundle\vvendor\t*.md\16*-lock.json\v*.lock\16*bundle*.js\15*build*.js\n.*rc*\v*.json\f*.min.*\n*.map\n*.bak\n*.zip\n*.pyc\f*.class\n*.sln\r*.Master\r*.csproj\n*.tmp\18*.csproj.user\f*.cache\n*.pdb\ntags*\rcscope.*\n*.exe\n*.dll\n*.mp3\n*.ogg\v*.flac\n*.swp\n*.swo\n*.bmp\n*.gif\n*.ico\n*.jpg\n*.png\n*.rar\n*.zip\n*.tar\r*.tar.gz\r*.tar.xz\14*.tar.bz2\n*.pdf\n*.doc\v*.docx\n*.ppt\v*.pptx\28gutentags_ctags_exclude\6g\bvim\0" },
    loaded = true,
    path = "/home/g/.local/share/nvim/site/pack/packer/start/vim-gutentags",
    url = "https://github.com/ludovicchabant/vim-gutentags"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n…\1\0\0\5\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\3B\1\2\1K\0\1\0\14highlight\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: fzf-lua
time([[Config for fzf-lua]], true)
try_loadstring("\27LJ\2\nÑ\6\0\0\a\0\29\0B6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0014\3\0\0B\1\2\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\b\0'\5\t\0005\6\n\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\v\0'\5\f\0005\6\r\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\14\0'\5\15\0005\6\16\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\17\0'\5\18\0005\6\19\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\20\0'\5\21\0005\6\22\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\23\0'\5\24\0005\6\25\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\26\0'\5\27\0005\6\28\0B\1\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\0022<cmd>lua require('fzf-lua').buffer_tags()<CR>\15<leader>ft\1\0\2\vsilent\2\fnoremap\0020<cmd>lua require('fzf-lua').git_files()<CR>\15<leader>fv\1\0\2\vsilent\2\fnoremap\2+<cmd>lua require('fzf-lua').grep()<CR>\15<leader>fg\1\0\2\vsilent\2\fnoremap\2.<cmd>lua require('fzf-lua').buffers()<CR>\15<leader>fb\1\0\2\vsilent\2\fnoremap\2/<cmd>lua require('fzf-lua').quickfix()<CR>\15<leader>fq\1\0\2\vsilent\2\fnoremap\2/<cmd>lua require('fzf-lua').oldfiles()<CR>\15<leader>fo\1\0\2\vsilent\2\fnoremap\2,<cmd>lua require('fzf-lua').files()<CR>\15<leader>ff\6n\20nvim_set_keymap\bapi\bvim\nsetup\ffzf-lua\20fzf-lua.actions\frequire\0", "config", "fzf-lua")
time([[Config for fzf-lua]], false)
-- Config for: vim-gutentags
time([[Config for vim-gutentags]], true)
try_loadstring("\27LJ\2\n¾\b\0\0\4\0\19\0-6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\1\0=\1\4\0006\0\0\0009\0\1\0005\1\6\0=\1\5\0006\0\0\0009\0\1\0006\1\0\0009\1\b\0019\1\t\1'\3\n\0B\1\2\2=\1\a\0006\0\0\0009\0\1\0+\1\2\0=\1\v\0006\0\0\0009\0\1\0+\1\2\0=\1\f\0006\0\0\0009\0\1\0+\1\2\0=\1\r\0006\0\0\0009\0\1\0+\1\2\0=\1\14\0006\0\0\0009\0\15\0'\2\16\0B\0\2\0016\0\0\0009\0\1\0005\1\18\0=\1\17\0K\0\1\0\1\3\0\0\23--tag-relative=yes\21--fields=+ailmnS\31gutentags_ctags_extra_args\\command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')\bcmd'gutentags_generate_on_empty_buffer gutentags_generate_on_write\"gutentags_generate_on_missing\30gutentags_generate_on_new\25~/.cache/nvim/ctags/\vexpand\afn\24gutentags_cache_dir\1\3\0\0\17package.json\t.git\27gutentags_project_root(gutentags_add_default_project_roots\1>\0\0\n*.git\n*.svg\t*.hg\14*/tests/*\nbuild\tdist\21*sites/*/files/*\bbin\17node_modules\21bower_components\ncache\rcompiled\tdocs\fexample\vbundle\vvendor\t*.md\16*-lock.json\v*.lock\16*bundle*.js\15*build*.js\n.*rc*\v*.json\f*.min.*\n*.map\n*.bak\n*.zip\n*.pyc\f*.class\n*.sln\r*.Master\r*.csproj\n*.tmp\18*.csproj.user\f*.cache\n*.pdb\ntags*\rcscope.*\n*.exe\n*.dll\n*.mp3\n*.ogg\v*.flac\n*.swp\n*.swo\n*.bmp\n*.gif\n*.ico\n*.jpg\n*.png\n*.rar\n*.zip\n*.tar\r*.tar.gz\r*.tar.xz\14*.tar.bz2\n*.pdf\n*.doc\v*.docx\n*.ppt\v*.pptx\28gutentags_ctags_exclude\6g\bvim\0", "config", "vim-gutentags")
time([[Config for vim-gutentags]], false)
-- Config for: AutoSave.nvim
time([[Config for AutoSave.nvim]], true)
try_loadstring("\27LJ\2\n†\3\0\0\b\0\17\0\0236\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0'\4\4\0006\5\5\0009\5\6\0059\5\a\5'\a\b\0B\5\2\2&\4\5\4=\4\t\0035\4\n\0=\4\v\0035\4\f\0004\5\0\0=\5\r\0045\5\14\0=\5\15\4=\4\16\3B\1\2\1K\0\1\0\15conditions\20filetype_is_not\1\2\0\0\bsql\20filename_is_not\1\0\2\vexists\2\15modifiable\2\vevents\1\3\0\0\16InsertLeave\16TextChanged\22execution_message\r%H:%M:%S\rstrftime\afn\bvim\24AutoSave: saved at \1\0\5\19debounce_delay\3‡\1 clean_command_line_interval\3\0\22write_all_buffers\1\20on_off_commands\2\fenabled\2\nsetup\rautosave\frequire\0", "config", "AutoSave.nvim")
time([[Config for AutoSave.nvim]], false)
-- Config for: nvim-neoclip.lua
time([[Config for nvim-neoclip.lua]], true)
try_loadstring("\27LJ\2\n¢\2\0\0\6\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\v\0005\4\a\0005\5\6\0=\5\b\0045\5\t\0=\5\n\4=\4\f\3=\3\r\2B\0\2\1K\0\1\0\tkeys\14telescope\1\0\0\6n\1\0\3\vselect\t<cr>\npaste\6p\17paste_behind\6P\6i\1\0\0\1\0\3\vselect\t<cr>\npaste\n<c-v>\17paste_behind\n<c-k>\ron_paste\1\0\1\fset_reg\1\1\0\4\fpreview\2\fhistory\3è\a\24content_spec_column\1\21default_register\6\"\nsetup\fneoclip\frequire\0", "config", "nvim-neoclip.lua")
time([[Config for nvim-neoclip.lua]], false)
-- Config for: complextras.nvim
time([[Config for complextras.nvim]], true)
try_loadstring("\27LJ\2\n|\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0]inoremap <c-x><c-d> <c-r>=luaeval(\"require('complextras').complete_line_from_cwd()\")<CR>\bcmd\bvim\0", "config", "complextras.nvim")
time([[Config for complextras.nvim]], false)
-- Config for: firenvim
time([[Config for firenvim]], true)
try_loadstring("\27LJ\2\né\1\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0É\1let g:firenvim_config = { \"globalSettings\": { \"alt\": \"all\", }, \"localSettings\": { \".*\": { \"cmdline\": \"neovim\", \"content\": \"text\", \"priority\": 0, \"selector\": \"textarea\", \"takeover\": \"never\", }, } }\bcmd\bvim\0", "config", "firenvim")
time([[Config for firenvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
