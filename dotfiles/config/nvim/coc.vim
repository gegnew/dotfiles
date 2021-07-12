 set hidden
 set nobackup
 set nowritebackup
 set cmdheight=2
 set updatetime=300
 set shortmess+=c
 set signcolumn=yes

 " Use tab for trigger completion with characters ahead and navigate.
 inoremap <silent><expr> <TAB>
       \ pumvisible() ? "\<C-n>" :
       \ <SID>check_back_space() ? "\<TAB>" :
       \ coc#refresh()
 inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

 function! s:check_back_space() abort
   let col = col('.') - 1
   return !col || getline('.')[col - 1]  =~# '\s'
 endfunction

 " Use <c-r> to refresh completion.
 inoremap <silent><expr> <c-r> coc#refresh()

 " select first completion item
 inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

 " Use `[g` and `]g` to navigate diagnostics
 " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
 nmap <silent> [g <Plug>(coc-diagnostic-prev)
 nmap <silent> ]g <Plug>(coc-diagnostic-next)

 nmap <silent> <leader>gd <Plug>(coc-definition)
 nmap <silent> <leader>gy <Plug>(coc-type-definition)
 nmap <silent> <leader>gi <Plug>(coc-implementation)
 nmap <silent> <leader>gr <Plug>(coc-references)

 " Use K to show documentation in preview window.
 nnoremap <silent> K :call <SID>show_documentation()<CR>
 function! s:show_documentation()
   if (index(['vim','help'], &filetype) >= 0)
     execute 'h '.expand('<cword>')
   elseif (coc#rpc#ready())
     call CocActionAsync('doHover')
   else
     execute '!' . &keywordprg . " " . expand('<cword>')
   endif
 endfunction

" " Symbol renaming.
" nmap <leader>nn <Plug>(coc-rename)

 " Formatting selected code.
 xmap <leader>f  <Plug>(coc-format-selected)
 nmap <leader>f  <Plug>(coc-format-selected)

 " Remap keys for applying codeAction to the current line.
 nmap <leader>ac  <Plug>(coc-codeaction)
 " Apply AutoFix to problem on the current line.
 nmap <leader>qf  <Plug>(coc-fix-current)

 " Snippets
 " Use <C-j> for jump to next placeholder, it's default of coc.nvim
 let g:coc_snippet_next = '<c-j>'

 " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
 let g:coc_snippet_prev = '<c-k>'

 " Use <C-j> for both expand and jump (make expand higher priority.)
 imap <C-j> <Plug>(coc-snippets-expand-jump)

 " Use <leader>x for convert visual selected code to snippet
 xmap <leader>x  <Plug>(coc-convert-snippet)

 autocmd FileType php set iskeyword+=$
