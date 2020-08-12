let mapleader = "\<SPACE>" " Map leader key
filetype off

" Install vim-plug if not already installed
" if empty(glob('~/.config/nvim/autoload/plug.vim'))
"   silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
"     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" endif

" Plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'neomake/neomake'

" Themes
Plug 'KeitaNakamura/neodark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'vimwiki/vimwiki'
" Plug 'starcraftman/vim-eclim'

" tpope
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-dispatch'

" Formatting
Plug 'sheerun/vim-polyglot' " language support
" Plug 'prettier/vim-prettier', {
"   \ 'do': 'yarn install',
"   \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'psf/black', { 'tag': '19.10b0' } " force upgrade black (https://github.com/psf/black/issues/1293)
" Plug 'nvie/vim-flake8'

Plug 'sodapopcan/vim-twiggy' " fugitive extension for git branch management
Plug 'junegunn/gv.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/vim-peekaboo'

" REPLs 'n stuff
Plug 'kassio/neoterm'
Plug 'Vigemus/iron.nvim'
Plug 'janko/vim-test' " run tests at the speed of thought!

" Navigation
Plug 'tmhedberg/SimpylFold'
Plug 'rhysd/clever-f.vim' " tentative replacement for quick-scope
" Plug 'unblevable/quick-scope'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mbbill/undotree'

" Deoplete
    " if has('nvim')
    "   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    " else
    "   Plug 'roxma/nvim-yarp'
    "   Plug 'roxma/vim-hug-neovim-rpc'
    " endif
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/neco-syntax' " Generic syntax completion (on Arch you need to `yay -S words`)

" Plug 'ervandew/supertab'

" Completion 
     " Try mucomplete

    " Try deoplete
    " Plug 'ujihisa/neco-look' " Dictionary completion
    " Plug 'deoplete-plugins/deoplete-jedi' " Python completion
    " Plug 'wellle/tmux-complete.vim' " Complete words in adjacent tmux panes
    " Plug 'prabirshrestha/async.vim' " Async for tmux-complete, needed for deoplete integration
    " Plug 'prabirshrestha/asyncomplete.vim' " ditto
    " Use Deoplete
        " let g:deoplete#enable_at_startup = 1
        " inoremap <expr><TAB>  pumvisible() ? /"\<C-n>" : /"\<TAB>" " <- fix
        " let g:tmuxcomplete#trigger = ''
        " " pynvim for deoplete:
        " " let g:python3_host_prog = '/home/g/.pyenv/versions/3.7.4/bin/python' 
        " " Ignore english autocomplete in python
        " let g:deoplete#ignore_sources = get(g:,'deoplete#ignore_sources',{})
        " let g:deoplete#ignore_sources.python = ['look']
        " let g:deoplete#custom#option#on_insert_enter = 'false'

    
    " " Try completor
    " Plug 'maralla/completor.vim'
    " Plug 'ferreum/completor-tmux'
    " " Use tab to trigger auto completion.  Default suggests completions as you type.
    " let g:completor_auto_trigger = 1
    " let g:completor_complete_options = 'menuone,noselect,preview'
    " noremap <silent> <leader>d :call completor#do('definition')<CR>
    " noremap <silent> <leader>c :call completor#do('doc')<CR>
    " noremap <silent> <leader>r :call completor#do('format')<CR>
    " noremap <silent> <leader>s :call completor#do('hover')<CR>
    
    Plug 'ajh17/VimCompletesMe'

    " Try coc.nvim
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Plug 'antoinemadec/coc-fzf'
    " source ~/.config/nvim/coc.vim
    " let g:coc_global_extensions = ['coc-emoji', 'coc-eslint', 'coc-prettier', 'coc-tsserver', 'coc-tslint', 'coc-tslint-plugin', 'coc-css', 'coc-json', 'coc-yaml', 'coc-ultisnips' ]

Plug 'machakann/vim-swap' " swap items in lists

Plug 'lambdalisue/suda.vim' " save files as sudo

" Plug 'ctrlpvim/ctrlp.vim' " fuzzy finder
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" Plug 'vim-scripts/gtags.vim'
" Plug 'ludovicchabant/vim-gutentags' " take care of gtags management
Plug 'majutsushi/tagbar'

Plug 'SirVer/ultisnips' " snippets part 1
Plug 'honza/vim-snippets' " snippets part 2
" Plug 'ervandew/supertab' " hopefully this fixes the tab-completion/snippet problem

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

" vimfiler
    let g:vimfiler_as_default_explorer = 1
    map <silent><leader>n :VimFiler -split -simple -winwidth=35 -toggle -no-quit <Enter>

" Undotree
nnoremap <leader>u :UndotreeToggle<cr>

" clever-f
let g:clever_f_smart_case = 1

" quick-scope
    " let g:qs_highlight_on_keys = ['f', 'F', 't', 'T'] " Trigger a highlight in the appropriate direction when pressing these keys:
    " let g:qs_highlight_on_keys = ['t', 'T'] " Trigger a highlight only when pressing f and F.
    " augroup qs_colors
    "   autocmd!
    "   autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
    "   autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
    " augroup END

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
    " let g:black_skip_string_normalization = 1
    let g:black_linelength = 88

" Run flake8 on  save
    " autocmd BufWritePost *.py call flake8#Flake8()

" Prettier
let g:prettier#autoformat = 0

" vim-test keymaps
    nmap <silent> g<C-n> :TestNearest<CR>
    nmap <silent> g<C-f> :TestFile<CR>
    " nnoremap <leader>tf :TestFile<cr>
    nmap <silent> g<C-s> :TestSuite<CR>
    nmap <silent> g<C-l> :TestLast<CR>
    nmap <silent> g<C-g> :TestVisit<CR>
    let test#java#runner = 'gradletest'
    let test#python#runner = 'pytest'
    " strategies for display tests [neovim, vtr, tmuxify, dispatch]
    let test#strategy = "dispatch"
    if has('nvim')
      tmap <C-o> <C-\><C-n>
    endif

" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

" Gutentags (disabled for now per  testing https://tbaggery.com/2011/08/08/effortless-ctags-with-git.html)
"     let g:gutentags_cache_dir = $HOME.'/.gutentags/'
    nnoremap <silent><Leader>t :TagbarToggle<CR>

" LeaderF
    let g:Lf_ShortcutF = "<leader>f"
    " let g:Lf_Ctags = '/usr/bin/ctags/'
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

" FZF
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.4, 'border': 'rounded'}}

" Snippets
    " let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips/', $HOME.'/.local/share/nvim/plugged/vim-snippets/snippets/']
    let g:UltiSnipsExpandTrigger="<c-e>"
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
set ignorecase
set nowrap
set scrolloff=3
set shortmess=atI " Don't show the vim intro message
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
" Set proper tabs
    set tabstop=4
    set shiftwidth=4
    set smarttab
    set expandtab
" Remap save and quit
    " map <Leader>ww :w<Enter>
    map <Leader>wq :wq<Enter>
    map <Leader>qq :q!<Enter>
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
