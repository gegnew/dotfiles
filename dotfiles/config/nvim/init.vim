 " Plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'neomake/neomake'
Plug 'psf/black'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'python', 'css', 'less', 'scss', 'json','markdown', 'yaml', 'html'] }
Plug 'nvie/vim-flake8'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-fugitive'
Plug 'sodapopcan/vim-twiggy' " fugitive extension for git branch management
" Plug 'jiangmiao/auto-pairs'
" TODO
Plug 'jpribyl/vim-ipython' " Johnny's fix for vim-ipython on Arch
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tmhedberg/SimpylFold'
Plug 'christoomey/vim-tmux-navigator'
Plug 'prettier/vim-prettier'
Plug 'KeitaNakamura/neodark.vim'
Plug 'flrnprz/plastic.vim'
" For deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Shougo/neco-syntax' " Generic syntax completion (on Arch you need to `yay -S words`)
Plug 'ujihisa/neco-look' " Dictionary completion
Plug 'deoplete-plugins/deoplete-jedi' " Python completion
Plug 'wellle/tmux-complete.vim' " Complete words in adjacent tmux panes
Plug 'prabirshrestha/async.vim' " Async for tmux-complete, needed for deoplete integration
Plug 'prabirshrestha/asyncomplete.vim' " ditto
Plug 'bfredl/nvim-ipy'
Plug 'lambdalisue/suda.vim'
Plug 'janko/vim-test' " run tests at the speed of thought!
" Plug 'SkyLeach/pudb.vim' " integration for pudb
Plug 'ctrlpvim/ctrlp.vim' " fuzzy finder
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'ludovicchabant/vim-gutentags' " take care of ctags management
Plug 'SirVer/ultisnips' " snippets part 1
Plug 'honza/vim-snippets' " snippets part 2
Plug 'ervandew/supertab' " hopefully this fixes the tab-completion/snippet problem

call plug#end()

 
" Plugin Configs

" Use deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:tmuxcomplete#trigger = ''
" let g:python3_host_prog = '/home/g/.pyenv/versions/3.7.4/bin/python' "pynvim for deoplete
" Ignore english autocomplete in python
let g:deoplete#ignore_sources = get(g:,'deoplete#ignore_sources',{})
let g:deoplete#ignore_sources.python = ['look']
let g:deoplete#custom#option#on_insert_enter = 'false'

" Run NeoMake on read and write operations
autocmd! BufReadPost,BufWritePost * Neomake
" Disable inherited syntastic
let g:syntastic_mode_map = {
			\"mode": "passive",
			\"active_filetypes": [],
			\"passive_filetypes": [] }

let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1

" NerdTree config
set nu " turn in line numbering in nerdtree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore .pyc files in NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
let NERDTreeToggleQuitOnOpen = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Neodark colorscheme config
colorscheme neodark " I like neodark but the highlighting makes it hard to read things
let g:neodark#terminal_transparent = 1
let g:neodark#use_256color = 1

" Run Black on save
" autocmd BufWritePre *.py execute ':Black'
" Run flake8 on  save
autocmd BufWritePost *.py call flake8#Flake8()

" nvim-ipy settings
let g:nvim_ipy_perform_mappings = 0  " obliterate mappings
map <silent> <c-s> <Plug>(Ipy-Run)
map <silent> <leader>a <Plug>(Ipy-RunAll
let g:ipy_celldef = "##"
map <silent> <leader>c <Plug>(Ipy-RunCell)

" vim-test keymaps
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
" nnoremap <leader>tf :TestFile<cr>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
" make test commands execute with :terminal in a split window
let test#strategy = "neovim"
" pudb integration (https://github.com/SkyLeach/pudb.vim)
" Nvim python environment settings
if has('nvim')
    tmap <C-o> <C-\><C-n> " vim-pytest remap to normal mode for scrolling
    " let g:pudb_breakpoint_symbol='☠'
endif

" LeaderF
" search word under cursor, the pattern is treated as regex, and enter normal mode directly
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search word under cursor, the pattern is treated as regex,
" append the result to previous search results.
noremap <C-G> :<C-U><C-R>=printf("Leaderf! rg --append -e %s ", expand("<cword>"))<CR>
" search word under cursor literally only in current buffer
noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg -F --current-buffer -e %s ", expand("<cword>"))<CR>
" search visually selected text literally, don't quit LeaderF after accepting an entry
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F --stayOpen -e %s ", leaderf#Rg#visual())<CR>
" recall last search. If the result window is closed, reopen it.
noremap go :<C-U>Leaderf! rg --stayOpen --recall<CR>

" Snippets
let g:UltiSnipsSnippetDirectories=[$HOME.'.config/nvim/UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

"Supertab
let g:SuperTabDefaultCompletionType = "<c-n>" " make supertab complete from the top


"===========SETTINGS============
" General
set nocompatible
filetype off
syntax on
set number
set relativenumber
set encoding=utf-8
set spelllang=en
set autoindent " Copy indent from last line when starting a new line
set autoread " Set to autoread when a file is changed from the outside
set ignorecase " ignore case while searching
set smartcase " unless a search term starts with a capital letter
set backspace=indent,eol,start
set clipboard=unnamedplus
set cursorline
    hi CursorLine term=bold cterm=bold guibg=Grey40 ctermbg=NONE
set splitbelow " New window goes below
set splitright " New window goes right
set foldmethod=indent " Enable folding
set foldlevel=99 
nnoremap  mf za " Enable folding
let g:SimpylFold_docstring_preview=1
set ignorecase
set nowrap
set scrolloff=3
set shortmess=atI " Don't show the vim intro message
set undofile " Persistent undo
set wrapscan " Wrap searches around end of file
let mapleader = "\<SPACE>" " Map leader key
"remap escape key to jk
    inoremap jk <esc>| 
" Set proper tabs
    set tabstop=4
    set shiftwidth=4
    set smarttab
    set expandtab
" Remap save
    map <Leader>w :w<Enter>
    map <Leader>wq :wq<Enter>
    map <Leader>q :q!<Enter>
let g:airline_theme='neodark'  " Set airline theme
"split navigations
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>
" Allow saving of files as sudo when I forgot to start vim using sudo.
    cmap w!! w !sudo tee > /dev/null %
" Generate splits
    nnoremap <silent> vv <C-w>v
    nnoremap <silent> zz <C-w>s
" Flag unnecessary whitespace
    highlight BadWhitespace ctermbg=red guibg=darkred
    au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" Treat .svelte files as HTML
    au! BufNewFile,Bufread *.svelte set ft=html
" remap buffer list
   map <Leader>b :ls<Enter>
" Useful commands
"nvim +checkhealth
" Change spaces to tabs in makefiles
autocmd FileType make setlocal noexpandtab
