let mapleader = "\<SPACE>" " Map leader key
filetype off

" Plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'neomake/neomake'

" Themes
Plug 'KeitaNakamura/neodark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" tpope
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'


" Formatting
Plug 'psf/black' " autoformat python the right way
Plug 'prettier/vim-prettier' " for other filetypes
Plug 'nvie/vim-flake8'

Plug 'sodapopcan/vim-twiggy' " fugitive extension for git branch management
Plug 'junegunn/gv.vim'

Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'

" REPLs 'n stuff
Plug 'kassio/neoterm'
Plug 'Vigemus/iron.nvim'
Plug 'janko/vim-test' " run tests at the speed of thought!

" Navigation
Plug 'tmhedberg/SimpylFold'
Plug 'unblevable/quick-scope'
Plug 'christoomey/vim-tmux-navigator'

" Deoplete
    if has('nvim')
      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
      Plug 'roxma/nvim-yarp'
      Plug 'roxma/vim-hug-neovim-rpc'
    endif
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/neco-syntax' " Generic syntax completion (on Arch you need to `yay -S words`)

Plug 'ujihisa/neco-look' " Dictionary completion
Plug 'deoplete-plugins/deoplete-jedi' " Python completion
Plug 'wellle/tmux-complete.vim' " Complete words in adjacent tmux panes
Plug 'prabirshrestha/async.vim' " Async for tmux-complete, needed for deoplete integration
Plug 'prabirshrestha/asyncomplete.vim' " ditto

Plug 'lambdalisue/suda.vim' " save files as sudo

" Plug 'ctrlpvim/ctrlp.vim' " fuzzy finder
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'vim-scripts/gtags.vim'
Plug 'ludovicchabant/vim-gutentags' " take care of gtags management
Plug 'majutsushi/tagbar'

Plug 'SirVer/ultisnips' " snippets part 1
Plug 'honza/vim-snippets' " snippets part 2
Plug 'ervandew/supertab' " hopefully this fixes the tab-completion/snippet problem

call plug#end()
luafile $HOME/.config/nvim/plugins.lua

" Plugin Configs
" Neoterm
    let &runtimepath.=',/home/g/.local/share/nvim/plugged/neoterm'
    filetype plugin on " neoterm
    command! -nargs=* T split | terminal <args> " hack for :terminal
    command! -nargs=* VT vsplit | terminal <args> " hack for :terminal
    command! -nargs=+ TT Topen | T <args>
    " let g:neoterm#autoscroll=1
    let g:neoterm_default_mod='belowright'
    " silent! helptags ALL " helptags for neoterm
    " nmap <leader>s :TREPLSendFile<Enter>
    " nmap <leader>l :TREPLSendLine<Enter>
    " vmap <leader>s :TREPLSendSelection<Enter>


" Use Deoplete
    let g:deoplete#enable_at_startup = 1
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    let g:tmuxcomplete#trigger = ''
    " let g:python3_host_prog = '/home/g/.pyenv/versions/3.7.4/bin/python' "pynvim for deoplete
    " Ignore english autocomplete in python
    let g:deoplete#ignore_sources = get(g:,'deoplete#ignore_sources',{})
    let g:deoplete#ignore_sources.python = ['look']
    let g:deoplete#custom#option#on_insert_enter = 'false'

" vimfiler
    let g:vimfiler_as_default_explorer = 1
    map <silent><leader>n :VimFiler -split -simple -winwidth=35 -toggle -no-quit <Enter>

" quick-scope
    let g:qs_highlight_on_keys = ['f', 'F', 't', 'T'] " Trigger a highlight in the appropriate direction when pressing these keys:
    " let g:qs_highlight_on_keys = ['t', 'T'] " Trigger a highlight only when pressing f and F.
    augroup qs_colors
      autocmd!
      autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
      autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
    augroup END

" Limelight
    map <silent> <leader>l :Limelight!!<Enter>
    " Color name (:help cterm-colors) or ANSI code
    let g:limelight_conceal_ctermfg = 'gray'
    let g:limelight_conceal_ctermfg = 243

    " Color name (:help gui-colors) or RGB color
    let g:limelight_conceal_guifg = 'DarkGray'
    let g:limelight_conceal_guifg = '#777777'

    " Default: 0.5
    let g:limelight_default_coefficient = 0.7

    " Number of preceding/following paragraphs to include (default: 0)
    let g:limelight_paragraph_span = 1

    " Beginning/end of paragraph
    "   When there's no empty line between the paragraphs
    "   and each paragraph starts with indentation
    let g:limelight_bop = '^\s'
    let g:limelight_eop = '\ze\n^\s'

    " Highlighting priority (default: 10)
    "   Set it to -1 not to overrule hlsearch
    let g:limelight_priority = -1

" Run Black on save
    " autocmd BufWritePre *.py execute ':Black'
    let g:black_skip_string_normalization = 1
    let g:black_linelength = 120

" Run flake8 on  save
    " autocmd BufWritePost *.py call flake8#Flake8()

" vim-test keymaps
    nmap <silent> g<C-n> :TestNearest<CR>
    nmap <silent> g<C-f> :TestFile<CR>
    " nnoremap <leader>tf :TestFile<cr>
    nmap <silent> g<C-s> :TestSuite<CR>
    nmap <silent> g<C-l> :TestLast<CR>
    nmap <silent> g<C-g> :TestVisit<CR>
    " make test commands execute with :terminal in a split window
    let test#strategy = "neovim"
    if has('nvim')
      tmap <C-o> <C-\><C-n>
    endif

" Gutentags
    let g:gutentags_cache_dir = $HOME.'/.gutentags/'
    nnoremap <silent><Leader>t :TagbarToggle<CR>

" LeaderF
    let g:Lf_ShortcutF = "<leader>f"
    let g:Lf_Ctags = '/usr/bin/ctags/'
    let g:Lf_WindowPosition = 'popup'
    let g:Lf_PreviewInPopup = 1
    let g:Lf_DefaultExternalTool = 'rg'
    " search word under cursor, the pattern is treated as regex, and enter normal mode directly
     noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
    " search word under cursor, the pattern is treated as regex, append the result to previous search results.
    noremap <C-H> :<C-U><C-R>=printf("Leaderf! rg --append -e %s ", expand("<cword>"))<CR>
    " search word under cursor literally only in current buffer
    noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg -F --current-buffer -e %s ", expand("<cword>"))<CR>
    " search visually selected text literally, don't quit LeaderF after accepting an entry
    xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F --stayOpen -e %s ", leaderf#Rg#visual())<CR>
    " recall last search. If the result window is closed, reopen it.
    noremap go :<C-U>Leaderf! rg --stayOpen --recall<CR>

" Snippets
    " let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips/', $HOME.'/.local/share/nvim/plugged/vim-snippets/snippets/']
    let g:UltiSnipsExpandTrigger="<c-e>"
    let g:UltiSnipsListSnippets="<c-l>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Supertab
    let g:SuperTabDefaultCompletionType = "<c-n>" " make supertab complete from the top

" Neodark colorscheme config
    colorscheme neodark " I like neodark but the highlighting makes it hard to read things
    let g:neodark#terminal_transparent = 1
    let g:neodark#use_256color = 1
    let g:neodark#solid_vertsplit = 1
    let g:airline_theme='neodark'  " Set airline theme

" Vimux and Vimux-Ipy
" map <Leader>vp :call VimuxIpy()<CR>
" vmap <silent> <Leader>e :python run_visual_code()<CR>
" noremap <silent> <Leader>c :python run_cell(save_position=False, cell_delim='##')<CR>

" for pdbpp, in insert or command mode, move with hjkl by using Ctrl
tnoremap <C-h> <Left>
tnoremap <C-j> <Down>
tnoremap <C-k> <Up>
tnoremap <C-l> <Right>

"===========SETTINGS============
" General
set nocompatible
" turn off syntax highlighting for inactive windows:
syntax manual
autocmd BufEnter * set syntax=on
autocmd BufLeave * set syntax=off
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
nnoremap  <leader>h za " Enable folding
let g:SimpylFold_docstring_preview=1
set ignorecase
set nowrap
set scrolloff=3
set shortmess=atI " Don't show the vim intro message
set undofile " Persistent undo
set wrapscan " Wrap searches around end of file
" set search highlighting (overrides Neodark)
hi Search ctermfg=black
hi Search ctermbg=yellow
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
" remap buffer list
   map <Leader>b :ls<Enter>
" Useful commands
"nvim +checkhealth
augroup FileTypeSpecificAutocommands
    " Two spaces for tabs in R files
    autocmd FileType r setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType '.Rd' setlocal tabstop=2 softtabstop=2 shiftwidth=2
    " Change spaces to tabs in makefiles
    autocmd FileType make setlocal noexpandtab
augroup END
