" a modified version of travsiwsims/vim-straight-quotes
" changes unicode quotes and dashes to ascii versions

:if exists('loaded_straight_quotes_plugin') | finish | endif
let loaded_straight_quotes_plugin = 1


function! s:FixQuotes(line1,line2)
    let l:save_cursor = getpos(".")
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/[“”]/"/g'
    silent! execute ':' . a:line1 . ',' . a:line2 . "s/[‘’]/'/g"
    silent! execute ':' . a:line1 . ',' . a:line2 . "s/[–]/-/g"
    silent! execute ':' . a:line1 . ',' . a:line2 . "s/[—]/-/g"
    call setpos('.', l:save_cursor)
endfunction

" Run ToAsc to substitute straight quotes for unicode quotes
command! -range=% ToAsc call <SID>FixQuotes(<line1>,<line2>)