let mapleader = "\<SPACE>" " Map leader key

" Install vim-plug if not already installed
" if empty(glob('~/.config/nvim/autoload/plug.vim'))
"   silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
"     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" endif

set shortmess=atIAF " Don't show the vim intro message
" Plugins
call plug#begin('~/.local/share/nvim/plugged')

" Themes
Plug 'KeitaNakamura/neodark.vim'
Plug 'itchyny/lightline.vim'

Plug 'vimwiki/vimwiki'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" tpope
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-sleuth'  " automatic tab formatting

" Formatting
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
Plug 'junegunn/goyo.vim'

" REPLs 'n stuff
Plug 'kassio/neoterm'
Plug 'voldikss/vim-floaterm'
Plug 'Vigemus/iron.nvim'
Plug 'janko/vim-test' " run tests at the speed of thought!

" Navigation
Plug 'tmhedberg/SimpylFold'
Plug 'unblevable/quick-scope'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mbbill/undotree'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'ap/vim-buftabline'
Plug 'ptzz/lf.vim' " depends on bclose
Plug 'rbgrouleff/bclose.vim'
Plug 'justinmk/vim-dirvish'
" Plug 'airblade/vim-gitgutter'


Plug 'Shougo/unite.vim'
Plug 'Shougo/neco-syntax' " Generic syntax completion (on Arch you need to `yay -S words`)

" Completion 
" Plug 'ujihisa/neco-look' " Dictionary completion
" Plug 'ajh17/VimCompletesMe'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'machakann/vim-swap' " swap items in lists

Plug 'lambdalisue/suda.vim' " save files as sudo

" Plug 'ctrlpvim/ctrlp.vim' " fuzzy finder
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" Plug 'vim-scripts/gtags.vim'
Plug 'ludovicchabant/vim-gutentags' " take care of gtags management
Plug 'majutsushi/tagbar'

Plug 'SirVer/ultisnips' " snippets part 1
Plug 'honza/vim-snippets' " snippets part 2

call plug#end()
luafile $HOME/.config/nvim/plugins.lua

" Plugin Configs
" Neoterm
let &runtimepath.=',/home/g/.local/share/nvim/plugged/neoterm'
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
nnoremap <leader>u :UndotreeToggle<cr>

" Navigation
    " netrw + vinegar
    let g:netrw_liststyle = 3
    let g:lf_map_keys = 0
    map <leader>r :Lf<CR>

" Dadbod + DadbodUI
    let g:db_ui_auto_execute_table_helpers = 1
    autocmd FileType sql setlocal omnifunc=vim_dadbod_completion#omni

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


" Neomake (linting)
let g:neomake_javascript_enabled_makers  = ['semistandard']
let g:neomake_open_list = 0
autocmd! BufWritePost,BufEnter * Neomake

" Neoformat
" let g:neoformat_try_formatprg = 1
let g:neoformat_enabled_javascript = ['semistandard']
let g:neoformat_verbose = 0
let g:neoformat_only_msg_on_error = 1
augroup NeoformatAutoFormat
    autocmd!
    autocmd FileType javascript setlocal formatprg=semistandard
    autocmd BufWritePre *.js Neoformat
augroup END
let g:neoformat_javascript_semistandard = {
            \ 'exe': 'semistandard',
            \ 'args': ['--stdin', '--env mocha', '--fix'],
            \ 'stdin': 1, 
            \ 'valid_exit_codes': [0, 1],
            \ }

let s:formatprg_for_filetype = {
      \ "javascript" : 'prettier-standard\ --stdin --stdin-filepath\ %'
      \}
for [ft, fp] in items(s:formatprg_for_filetype)
  execute 'autocmd FileType '.ft." let &l:formatprg=\"".fp."\" | setlocal formatexpr="
endfor

" vim-test keymaps
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
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

" LeaderF
" let g:Lf_ShortcutF = '<leader>f'
" let g:Lf_Ctags = '/usr/bin/ctags/'
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_DefaultExternalTool = 'rg'
" search word under cursor, the pattern is treated as regex, and enter normal mode directly
 noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search word under cursor, the pattern is treated as regex, append the result to previous search results.
noremap <leader>fl :<C-U><C-R>=printf("Leaderf! rg --append -e %s ", expand("<cword>"))<CR>
" search word under cursor literally only in current buffer
noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg -F --current-buffer -e %s ", expand("<cword>"))<CR>
" search visually selected text literally, don't quit LeaderF after accepting an entry
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F --stayOpen -e %s ", leaderf#Rg#visual())<CR>
" recall last search. If the result window is closed, reopen it.
noremap go :<C-U>Leaderf! rg --stayOpen --recall<CR>

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
" search tags in this buffer
noremap <leader>fh :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
" search all tags
noremap <leader>ft :<C-U><C-R>=printf("LeaderfTag %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

" FZF
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.4, 'border': 'rounded'}}
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_buffers_jump = 1
" override snippets command to search description
command! -bar -bang Snippets
  \ call fzf#vim#snippets({'options': '--ansi --tiebreak=index +m'}, <bang>0)

" Snippets
" let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips/', $HOME.'/.local/share/nvim/plugged/vim-snippets/snippets/']
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:ultisnips_python_style='google'

" " Supertab
"     let g:SuperTabDefaultCompletionType = "<c-n>" " make supertab complete from the top

" VimWiki
let g:vimwiki_list = [{'path': '~/share/mywiki/',
                  \ 'path_html': '~/share/mywiki_html',
                  \ 'syntax': 'markdown',
                  \ 'ext': '.md'}]
let g:GPGFilePattern = '*.\(gpg\|asc\|pgp\)\(.md\)\='
" Make new diary entries using a template
au BufNewFile ~/share/mywiki/diary/*.md :silent 0r !~/share/mywiki/diary/template '%'
nnoremap <leader>dn :VimwikiMakeDiaryNote<cr>
nnoremap <leader>dt :VimwikiMakeTomorrowDiaryNote<cr>
nnoremap <leader>dy :VimwikiMakeYesterdayDiaryNote<cr>
nnoremap <leader>di :VimwikiDiaryGenerateLinks<cr> :VimwikiDiaryIndex<cr>

" Neodark colorscheme config
colorscheme neodark " I like neodark but the highlighting makes it hard to read things
let g:neodark#terminal_transparent = 1
let g:neodark#use_256color = 1
let g:neodark#solid_vertsplit = 1
let g:lightline = {
    \ 'colorscheme': 'neodark',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             ['server',  'modified', 'readonly', 'filename', 'gitbranch' ] ],
    \  'right': [ [ 'lineinfo' ],
    \             [ 'percent' ],
    \             [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
    \ },
    \ 'component': {
    \   'server': v:servername
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ }
let g:lightline.separator = {
	\   'left': '', 'right': ''
  \}
let g:lightline.subseparator = {
	\   'left': '', 'right': '' 
  \}


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
" turn off syntax highlighting for inactive windows:
syntax manual
autocmd BufEnter * set syntax=on
autocmd BufLeave * set syntax=off
syntax on
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
    hi CursorLine term=bold cterm=bold guibg=Grey40 ctermbg=NONE
set splitbelow " New window goes below
set splitright " New window goes right
set foldmethod=indent " Enable folding
set foldlevel=99 
nnoremap  <leader>h za " Enable folding
let g:SimpylFold_docstring_preview=1
set nowrap
set scrolloff=3
set shortmess=atIAFc " Don't show the vim intro message
set undofile " Persistent undo
set wrapscan " Wrap searches around end of file
" set italicized comments
highlight Comment cterm=italic
" set search highlighting (overrides Neodark)
hi Search ctermfg=black
hi Search ctermbg=yellow
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
    map <Leader>s :w<Enter>
    " map <Leader>wq :wq<Enter>
    map <Leader>q :q!<Enter>
    map <Leader>dd :bd<Enter>
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
" Treat .svelte files as HTML
    au! BufNewFile,Bufread *.svelte set ft=html
" remap buffer list (now with vim-buffergator)
   " map <Leader>b :ls<Enter>
" switch to next-previous buffer
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>

" Useful commands
"nvim +checkhealth

augroup FileTypeSpecificAutocommands
    autocmd!
    " Two spaces for tabs in R files
    autocmd FileType r setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType '.Rd' setlocal tabstop=2 softtabstop=2 shiftwidth=2
    " Change spaces to tabs in makefiles
    autocmd FileType make setlocal noexpandtab
    " Javascript
    autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END
