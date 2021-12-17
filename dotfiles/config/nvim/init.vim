let mapleader = "\<SPACE>" " Map leader key


" this is a nice lua-based layout
" https://github.com/kuator/nvim/tree/master/lua

let $MIX_ENV='test'

" Install vim-plug if not already installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

set shortmess=atIAF " Don't show the vim intro message
" Plugins
lua require('init')
call plug#begin('~/.local/share/nvim/plugged')

" Themes
Plug 'ayu-theme/ayu-vim'
" Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-gruvbox8'
Plug 'itchyny/lightline.vim'
  let g:lightline = {
        \ 'colorscheme': 'gruvbox8',
        \ }
Plug 'TaDaa/vimade'
Plug 'felipec/vim-sanegx'
Plug 'vimwiki/vimwiki'
Plug 'ntpeters/vim-better-whitespace'

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
" Plug github.com/xi/vim-indent-detect'tpope/vim-sleuth'  " automatic tab formatting
Plug 'xi/vim-indent-detect'
Plug 'tpope/vim-rhubarb'

" Plug '9mm/vim-closer'

Plug 'svermeulen/vim-cutlass'
  nnoremap x d
  xnoremap x d
  nnoremap xx dd
  nnoremap X D
Plug 'svermeulen/vim-yoink'
  let g:yoinkChangeTickThreshold  = 1 " fixes issue with AutoSave
  let g:yoinkIncludeDeleteOperations = 1
  let g:yoinkSyncSystemClipboardOnFocus = 0
  let g:yoinkSavePersistently = 1
  nmap <c-n> <plug>(YoinkPostPasteSwapBack)
  nmap <c-p> <plug>(YoinkPostPasteSwapForward)
  nmap p <plug>(YoinkPaste_p)
  nmap P <plug>(YoinkPaste_P)
  nmap gp <plug>(YoinkPaste_gp)
  nmap gP <plug>(YoinkPaste_gP)
  nmap [y <plug>(YoinkRotateBack)
  nmap ]y <plug>(YoinkRotateForward)
  nmap <c-=> <plug>(YoinkPostPasteToggleFormat)

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
Plug 'neomake/neomake'
Plug 'sbdchd/neoformat'

" Plug 'prettier/vim-prettier', {
" \ 'do': 'yarn install',
" \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'psf/black'
" Plug 'nvie/vim-flake8'
Plug 'alfredodeza/jacinto.vim'
Plug 'elzr/vim-json'

Plug 'sodapopcan/vim-twiggy' " fugitive extension for git branch management
Plug 'junegunn/gv.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'

" REPLs 'n stuff
Plug 'kassio/neoterm'
Plug 'francoiscabrol/ranger.vim' " depends on bclose
Plug 'voldikss/vim-floaterm'
Plug 'moll/vim-bbye' " replaces bclose
command! -bang -complete=buffer -nargs=? Bclose Bdelete<bang> <args>
Plug 'jpalardy/vim-slime'
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
  let g:slime_target = 'tmux'
  let g:slime_python_ipython = 1
  let g:slime_default_config = {
              \ 'socket_name': get(split($TMUX, ','), 0),
              \ 'target_pane': '{top-right}' }
  let g:slime_dont_ask_default = 1
  nnoremap <Leader>i<cr> :SlimeSend1 ipython --matplotlib<CR>
  nnoremap <Leader>ia :IPythonCellRun<CR>
  nnoremap <Leader>it :IPythonCellRunTime<CR>
  nnoremap <Leader>ii :IPythonCellExecuteCell<CR>
  nnoremap <Leader>ij :IPythonCellExecuteCellJump<CR>
  nnoremap <Leader>ic :IPythonCellClear<CR>
  nnoremap <Leader>ix :IPythonCellClose<CR>
  nnoremap [i :IPythonCellPrevCell<CR>
  nnoremap ]i :IPythonCellNextCell<CR>
  " nmap <Leader>il <Plug>SlimeLineSend
  nmap <Leader>il :SlimeSendCurrentLine
  xmap <Leader>is <Plug>SlimeRegionSend
  nnoremap <Leader>ip :IPythonCellPrevCommand<CR>
  nnoremap <Leader>iQ :IPythonCellRestart<CR>
  nnoremap <Leader>id :SlimeSend1 %debug<CR>
  nnoremap <Leader>iq :SlimeSend1 exit<CR>
  nmap <Leader>iO :IPythonCellInsertAbove<CR>a
  nmap <Leader>io :IPythonCellInsertBelow<CR>a
  augroup ipython_cell_highlight
      autocmd!
      autocmd ColorScheme * highlight IPythonCell ctermbg=238 guifg=darkgrey guibg=#444d56
  augroup END

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
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
Plug 'justinmk/vim-dirvish'
Plug 'airblade/vim-gitgutter'
  nnoremap <leader>gg :GitGutterToggle<cr>
  nnoremap <leader>gn :GitGutterNextHunk<cr>
  nnoremap <leader>gp :GitGutterPrevHunk<cr>
Plug 'simeji/winresizer'
  let g:winresizer_start_key = '<leader>e'
Plug 'farmergreg/vim-lastplace'
Plug 'mattboehm/vim-accordion'
  nnoremap <leader>ll :Accordion 2<CR>
  nnoremap <leader>lj :AccordionZoomIn<CR>
  nnoremap <leader>lk :AccordionZoomOut<CR>
Plug 'machakann/vim-highlightedyank'
Plug 'ojroques/vim-oscyank'

" Plug 'Shougo/neco-syntax' " Generic syntax completion (on Arch you need to `yay -S words`)

" Completion
" Plug 'ujihisa/neco-look' " Dictionary completion
" Plug 'ajh17/VimCompletesMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kevinoid/vim-jsonc'


" let g:coq_settings = { 'auto_start': 'shut-up' }
Plug 'machakann/vim-swap' " swap items in lists
Plug 'andymass/vim-matchup'

Plug 'lambdalisue/suda.vim' " save files as sudo

" Plug 'ctrlpvim/ctrlp.vim' " fuzzy finder
Plug 'Yggdroot/indentLine'
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Plug 'vim-scripts/gtags.vim'
Plug 'majutsushi/tagbar'

Plug 'SirVer/ultisnips' " snippets part 1
Plug 'honza/vim-snippets' " snippets part 2

call plug#end()

" Plugin Configs
" Neoterm
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
    let g:floaterm_keymap_toggle = '<C-f>'
  " nnoremap   <Leader>fl      :FloatermNew! cd && cd -<CR>
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
  \ 'coc-jedi',
  \ 'coc-pairs',
  \ ]
  " \ 'coc-pyright',
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
nnoremap <leader>b :Black<CR>
" let g:black_skip_string_normalization = 1
let g:black_linelength = 88
let g:black_quiet = 1

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

nnoremap <silent><Leader>c :TagbarToggle<CR>
" nnoremap <silent><Leader>c :TagbarOpen fj<CR>
let g:tagbar_autofocus = 1

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
" let g:vimwiki_list = [{'path': '~/Sync/mywiki/',
"                   \ 'path_html': '~/Sync/mywiki_html',
"                   \ 'syntax': 'markdown',
"                   \ 'ext': '.md'}
" ]
let g:vimwiki_list = [{'path': '~/Sync/obsidian/vault',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

let g:GPGFilePattern = '*.\(gpg\|asc\|pgp\)\(.md\)\='
let g:vimwiki_folding='custom'
let g:vimwiki_global_ext = 0

autocmd FileType vimwiki setlocal syntax=markdown
autocmd FileType vimwiki setlocal foldenable


" Make new diary entries using a template
" au BufNewFile ~/Sync/mywiki/diary/*.md :silent 0r !~/Sync/mywiki/diary/template '%'
au BufNewFile ~/Sync/obsidian/vault/diary/*.md :silent 0r !~/Sync/obsidian/vault/diary/template '%'
nnoremap <leader>dn :VimwikiMakeDiaryNote<cr>
nnoremap <leader>dt :VimwikiMakeTomorrowDiaryNote<cr>
nnoremap <leader>dy :VimwikiMakeYesterdayDiaryNote<cr>
nnoremap <leader>di :VimwikiDiaryGenerateLinks<cr> :VimwikiDiaryIndex<cr>

colorscheme gruvbox8
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
nnoremap Y y$ " yank to end of line
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
" set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P " percentage through file
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
    " let g:detectindent_preferred_expandtab

" No backup or swap files
set nobackup
set noswapfile
set wildmenu
set wildmode=longest:full,full
" Copy from without copying line numbers
set mouse=a
set hidden
set cmdheight=1
" Remap save and quit
    " map <C-w> :w<Enter>
    " map <leader>ww :w<Enter>
    map <C-q> :qa!<Enter>
    map <leader>qq :Sayonara<Enter>
    map <leader>dd :Sayonara!<Enter>
"split navigations
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>
" Generate splits
    nnoremap <silent> vv <C-w>v
    nnoremap <silent> zz <C-w>s
" Flag unnecessary whitespace
    " highlight BadWhitespace ctermbg=red guibg=darkred
    " au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" switch to next-previous buffer (or with [b ]b)
" nnoremap <C-n> :bn<CR>
" nnoremap <C-p> :bp<CR>
" switch between most recent buffers with double-leader
  nnoremap <leader><leader> <c-^>
" Swap ` and ' for marks
  nnoremap ' `
  nnoremap ` '
" append a semicolon to the end of the line in insert mode
  imap ;; <ESC>A;<ESC>

" Useful commands
"nvim +checkhealth

augroup FileTypeSpecificAutocommands
    autocmd!
    " autocmd TextChanged,TextChangedI <buffer> silent write " autosave
    " Two spaces for tabs in R files
    autocmd FileType r setlocal tabstop=2 softtabstop=2 shiftwidth=2
    " autocmd FileType '.Rd' setlocal tabstop=2 softtabstop=2 shiftwidth=2
    " Change spaces to tabs in makefiles
    autocmd FileType make setlocal noexpandtab
    " Javascript
    " autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2
    au FileType vimwiki setlocal syntax=markdown
    autocmd FileType markdown set foldmethod=expr foldexpr=NestedMarkdownFolds()
augroup END

let g:tmuxline_theme = 'lightline'
nmap <leader>tm :Tmuxline lightline<CR>
if filereadable(expand("~/.colorscheme"))
  source ~/.colorscheme
endif

set cursorline
    " hi CursorLine term=bold cterm=bold guibg=NONE ctermbg=NONE
    hi CursorLine gui=bold cterm=bold term=bold guibg=NONE
    hi Comment gui=italic cterm=italic term=italic
    set fillchars+=vert:│
    hi VertSplit ctermbg=NONE guibg=NONE guifg=lightblue
    set numberwidth=3
    set signcolumn=auto


function! SynGroup()
  "show highlight group of current cursor location
  let l:s = synID(line('.'), col('.'), 1)
  echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
