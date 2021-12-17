" function! ChooseBuffer ( buffername )
"     let bnr = bufwinnr(a:buffername)
"     if bnr > 0
"        :exe bnr . "wincmd w"
"     else
"        echo a:buffername . ' is not existent'
"        silent execute 'split ' . a:buffername
"     endif
"  endfunction

function choosebuffer#ChooseBuffer ( buffername )
    let bnr = bufnr(a:buffername)
    echo win_findbuf(bufnr(a:buffername))
    " if bnr > 0
    "     :exe bnr . "wincmd w"
    " else
    "     echo a:buffername . ' does not exist'
    " endif
endfunction
