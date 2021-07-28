let mapleader = "\<SPACE>" " Map leader key

let $MIX_ENV='test'

" Install vim-plug if not already installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

set shortmess=atIAF " Don't show the vim intro message
" Plugins
lua require('plugins')
call plug#begin('~/.local/share/nvim/plugged')

" Themes
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'TaDaa/vimade'

Plug 'vimwiki/vimwiki'

Plug 'thaerkh/vim-workspace'
Plug 'jalvesaq/Nvim-R'

" tpope
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-sleuth'  " automatic tab formatting
Plug 'tpope/vim-rhubarb'

Plug 'svermeulen/vim-cutlass'
  nnoremap x d
  xnoremap x d

  nnoremap xx dd
  nnoremap X D
Plug 'svermeulen/vim-yoink'
  let g:yoinkIncludeDeleteOperations = 1
Plug 'svermeulen/vim-subversive'
  nmap s <plug>(SubversiveSubstitute)
  nmap ss <plug>(SubversiveSubstituteLine)
  nmap S <plug>(SubversiveSubstituteToEndOfLine)
  nmap <leader>s <plug>(SubversiveSubvertRange)
  xmap <leader>s <plug>(SubversiveSubvertRange)

  nmap <leader>ss <plug>(SubversiveSubvertWordRange)

Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'
Plug 'masukomi/vim-markdown-folding'

" Formatting
let g:polyglot_disabled = ['markdown']
Plug 'sheerun/vim-polyglot' " language support
Plug 'neomake/neomake'
Plug 'sbdchd/neoformat'

" Plug 'prettier/vim-prettier', {
" \ 'do': 'yarn install',
" \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'psf/black', { 'tag': '19.10b0' } " force upgrade black (https://github.com/psf/black/issues/1293)
" Plug 'nvie/vim-flake8'
Plug 'alfredodeza/jacinto.vim'
Plug 'elzr/vim-json'

Plug 'sodapopcan/vim-twiggy' " fugitive extension for git branch management
Plug 'junegunn/gv.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'

" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'

" REPLs 'n stuff
" Plug 'kassio/neoterm'
Plug 'francoiscabrol/ranger.vim' " depends on bclose
Plug 'voldikss/vim-floaterm'
Plug 'moll/vim-bbye' " replaces bclose
command! -bang -complete=buffer -nargs=? Bclose Bdelete<bang> <args>

" Plug 'Vigemus/iron.nvim'
Plug 'janko/vim-test' " run tests at the speed of thought!
Plug 'rcarriga/vim-ultest', { 'do': ':UpdateRemotePlugins' }
" let test#custom_runners = {'R': ['testthat']}

" Navigation
Plug 'tmhedberg/SimpylFold'  " fold Python code properly
Plug 'unblevable/quick-scope'
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug 'simnalamburt/vim-mundo'
"
Plug 'ap/vim-buftabline'
Plug 'justinmk/vim-dirvish'
Plug 'airblade/vim-gitgutter'
  nnoremap <leader>gg :GitGutterToggle<cr>
Plug 'simeji/winresizer'
Plug 'farmergreg/vim-lastplace'
Plug 'mattboehm/vim-accordion'
  nnoremap <leader>ll :Accordion 2<CR>
  nnoremap <leader>lj :AccordionZoomIn<CR>
  nnoremap <leader>lk :AccordionZoomOut<CR>
Plug 'machakann/vim-highlightedyank'
Plug 'ojroques/vim-oscyank'

" Plug 'Shougo/unite.vim' " delete this?
" Plug 'Shougo/neco-syntax' " Generic syntax completion (on Arch you need to `yay -S words`)

" Completion 
" Plug 'ujihisa/neco-look' " Dictionary completion
" Plug 'ajh17/VimCompletesMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kevinoid/vim-jsonc'

Plug 'machakann/vim-swap' " swap items in lists
Plug 'jiangmiao/auto-pairs'
Plug 'andymass/vim-matchup'

Plug 'lambdalisue/suda.vim' " save files as sudo

" Plug 'ctrlpvim/ctrlp.vim' " fuzzy finder
Plug 'Yggdroot/indentLine'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Plug 'vim-scripts/gtags.vim'
Plug 'ludovicchabant/vim-gutentags' " take care of gtags management
Plug 'majutsushi/tagbar'

Plug 'SirVer/ultisnips' " snippets part 1
Plug 'honza/vim-snippets' " snippets part 2

call plug#end()
" luafile $HOME/.config/nvim/plugins.lua "only needed for iron.nvim

" Plugin Configs
" Neoterm
let g:gutentags_cache_dir = $HOME.'/.gutentags/'
let &runtimepath.=','.$HOME.'/.local/share/nvim/plugged/neoterm'
filetype plugin on " neoterm
command! -nargs=* T split | terminal <args> " hack for :terminal
command! -nargs=* VT vsplit | terminal <args> " hack for :terminal
command! -nargs=+ TT Topen | T <args>
let g:neoterm#autoscroll=1
let g:neoterm_default_mod='belowright'
" silent! helptags ALL " helptags for neoterm
nmap <leader>if :TREPLSendFile<Enter>
nmap <leader>il :TREPLSendLine<Enter>
vmap <leader>is :TREPLSendSelection<Enter>

" Undotree
" nnoremap <leader>u :UndotreeToggle<cr>
nnoremap <leader>u :MundoToggle<cr>

" Navigation
    " netrw + vinegar
    let g:netrw_liststyle = 3
    let g:lf_map_keys = 0
    map <leader>r :FloatermNew ranger<CR>
    let g:floaterm_keymap_toggle = '<leader>n'
    let g:floaterm_width = 0.8
    let g:floaterm_height = 0.8
    let g:floaterm_opener = 'edit'

" Dadbod + DadbodUI
    let g:db_ui_auto_execute_table_helpers = 1
    autocmd FileType sql setlocal omnifunc=vim_dadbod_completion#omni

" Completion
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-snippets',
  \ 'coc-json',
  \ 'coc-prettier',
  \ 'coc-phpactor'
  \ ]
source $HOME/.config/nvim/coc.vim

" quick-scope
    " Move across wrapped lines like regular lines
    let g:qs_highlight_on_keys = ['f', 'F', 't', 'T'] " Trigger a highlight in the appropriate direction when pressing these keys:
    " let g:qs_highlight_on_keys = ['t', 'T'] " Trigger a highlight only when pressing f and F.
    augroup qs_colors
      autocmd!
      autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=99 cterm=underline
      autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=125 cterm=underline
    augroup END

" Run Black on save
" autocmd BufWritePre *.py execute ':Black'
" let g:black_skip_string_normalization = 1
let g:black_linelength = 88

" " Neomake (linting)
" let g:neomake_open_list = 0
" autocmd! BufWritePost,BufEnter * Neomake

" " Neoformat
" " let g:neoformat_try_formatprg = 1
" let g:neoformat_verbose = 0
" let g:neoformat_only_msg_on_error = 1

" coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" vim-test and vim-ultest keymaps
let test#python#pytest#options = "--color=yes"
let test#javascript#mocha#options = "--color"
nmap ]t <Plug>(ultest-next-fail)
nmap [t <Plug>(ultest-prev-fail)

nmap <silent> t<C-n> :UltestNearest<CR>
nmap <silent> t<C-f> :Ultest<CR>
nmap <silent> t<C-t> :UltestSummary<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

nmap <silent> tt<C-n> :TestNearest<CR>
nmap <silent> tt<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" run nearest test on save
" augroup UltestRunner
"     au!
"     au BufWritePost * UltestNearest
" augroup END

let test#java#runner = 'gradletest'
let test#python#runner = 'pytest'
" strategies for display tests [neovim, vtr, tmuxify, dispatch]
let test#strategy = "neovim"
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif

" tpope
" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

" Gutentags (disabled for now per  testing https://tbaggery.com/2011/08/08/effortless-ctags-with-git.html)
let g:gutentags_cache_dir = $HOME.'/.gutentags/'
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['package.json', '.git', 'composer.json']
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_ctags_extra_args = [
      \ '--tag-relative=yes',
      \ '--fields=+ailmnS',
      \ ]
nnoremap <silent><Leader>c :TagbarToggle<CR>
" clear gutentags cache quickly:
" command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')

" Telescope (https://github.com/nvim-telescope/telescope.nvim)
" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fr <cmd>lua require('telescope.builtin').oldfiles()<cr>
nnoremap <leader>fm <cmd>lua require('telescope.builtin').marks()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" FZF
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.4, 'border': 'rounded'}}
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_buffers_jump = 1
" override snippets command to search description
command! -bar -bang Snippets
  \ call fzf#vim#snippets({'options': '--ansi --tiebreak=index +m'}, <bang>0)

" Snippets
let g:UltiSnipsExpandTrigger = "<nop>" " necessary to free up coc.nvim

" VimWiki
let g:vimwiki_list = [{'path': '~/share/mywiki/',
                  \ 'path_html': '~/share/mywiki_html',
                  \ 'syntax': 'markdown',
                  \ 'ext': '.md'}]
let g:GPGFilePattern = '*.\(gpg\|asc\|pgp\)\(.md\)\='
let g:vimwiki_folding='custom'
let g:vimwiki_global_ext = 0

autocmd FileType vimwiki setlocal syntax=markdown
autocmd FileType vimwiki setlocal foldenable


" Make new diary entries using a template
au BufNewFile ~/share/mywiki/diary/*.md :silent 0r !~/share/mywiki/diary/template '%'
nnoremap <leader>dn :VimwikiMakeDiaryNote<cr>
nnoremap <leader>dt :VimwikiMakeTomorrowDiaryNote<cr>
nnoremap <leader>dy :VimwikiMakeYesterdayDiaryNote<cr>
nnoremap <leader>di :VimwikiDiaryGenerateLinks<cr> :VimwikiDiaryIndex<cr>

colorscheme gruvbox
set termguicolors

let g:highlightedyank_highlight_duration = 420

" Vimux and Vimux-Ipy
" map <Leader>vp :call VimuxIpy()<CR>
" vmap <silent> <Leader>e :python run_visual_code()<CR>
" noremap <silent> <Leader>c :python run_cell(save_position=False, cell_delim='##')<CR>


" for pdbpp, in insert or command mode, move with hjkl by using Ctrl
tnoremap <C-h> <Left>
tnoremap <C-j> <Down>
tnoremap <C-k> <Up>
tnoremap <C-l> <Right>

"===========TEST_SETTINGS============
" These are from https://www.hillelwayne.com/post/intermediate-vim/
" Let's see how I like them
nnoremap Q @@ " repeat last macro
nnoremap Y y$ "yank to end of line
set lazyredraw

"===========SETTINGS============
" General
set nocompatible
if has("autocmd")
  filetype plugin indent on
endif

hi Normal guibg=NONE ctermbg=NONE
let g:vimade = {}
let g:vimade.fadelevel = 0.7
" " turn off highlight active window:
"   hi InactiveWindow guibg=#00040B "#0D1B22
"   hi ActiveWindow guibg=NONE
"   " Call method on window enter
"   augroup WindowManagement
"     autocmd!
"     autocmd WinEnter * call Handle_Win_Enter()
"   augroup END
"   " Change highlight group of active/inactive windows
"   function! Handle_Win_Enter()
"     setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
"   endfunction

" set cc=88
set number
set relativenumber
set encoding=utf-8
set spelllang=en
set autoindent " Copy indent from last line when starting a new line
set autoread " Set to autoread when a file is changed from the outside
set ignorecase " ignore case while searching
set smartcase " unless a search term starts with a capital letter
set backspace=indent,eol,start
" pasting sanity
    set clipboard=unnamedplus
    set pastetoggle=<leader>p
    set showmode
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P " percentage through file
set cursorline
    " hi CursorLine term=bold cterm=bold guibg=NONE ctermbg=NONE
    hi CursorLine gui=bold cterm=bold term=bold
    hi Comment gui=italic cterm=italic term=italic
    set fillchars+=vert:│
    hi VertSplit ctermbg=NONE guibg=NONE guifg=lightblue
    set numberwidth=3
    set signcolumn=auto 

set splitbelow " New window goes below
set splitright " New window goes right
set foldmethod=indent " Enable folding
set foldlevel=99 
nnoremap  <leader>h za " Enable folding
let g:SimpylFold_docstring_preview=1
set nowrap
set scrolloff=3
" Persistent undo config for Undotree
set undofile
set undodir=~/.vim/undo
" set italicized comments
highlight Comment cterm=italic
" set highlighting for vim-dispatch quickfix window
    highlight TestOk    ctermbg=green
    highlight TestError ctermbg=red

    syn match TestOk    "\<Ok:"
    syn match TestError "\<Err:"
"remap escape key to jk
    inoremap jk <esc>| 
" Set proper tabs (overwritten by sleuth.vim)
    " set tabstop=4
    " set shiftwidth=4
    " set smarttab
    " set expandtab
" No backup or swap files
set nobackup
set noswapfile
set wildmenu
set wildmode=longest:full,full
" Copy from without copying line numbers
set mouse=a
" Remap save and quit
    map <C-s> :w<Enter>
    " map <Leader>wq :wq<Enter>
    map <C-q> :q!<Enter>
    map <leader>dd :Bclose<Enter> " close buffer
    " map <leader>dd :bd!<Enter> " close buffer
    " nmap <leader>ds :b#<bar>bd#<CR> " close buffer but keep split open
"split navigations
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>
" Generate splits
    nnoremap <silent> vv <C-w>v
    nnoremap <silent> zz <C-w>s
" Flag unnecessary whitespace
    highlight BadWhitespace ctermbg=red guibg=darkred
    au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" switch to next-previous buffer (or with [b ]b)
" nnoremap <C-n> :bn<CR>
" nnoremap <C-p> :bp<CR>

" Useful commands
"nvim +checkhealth

augroup FileTypeSpecificAutocommands
    autocmd!
    " autocmd TextChanged,TextChangedI <buffer> silent write " autosave
    " Two spaces for tabs in R files
    " autocmd FileType r setlocal tabstop=2 softtabstop=2 shiftwidth=2
    " autocmd FileType '.Rd' setlocal tabstop=2 softtabstop=2 shiftwidth=2
    " Change spaces to tabs in makefiles
    autocmd FileType make setlocal noexpandtab
    " Javascript
    " autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2
    au FileType vimwiki setlocal syntax=markdown
    autocmd FileType markdown set foldmethod=expr foldexpr=NestedMarkdownFolds()
augroup END

" this is at the end so Tmuxline can be run
if filereadable(expand("~/.colorscheme"))
  source ~/.colorscheme
endif
