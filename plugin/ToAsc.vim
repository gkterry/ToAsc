"this code is modified from traviswsims/straight-quotes plugin
"this plugin will change unicode quotes and dashes to their ascii versions
"to execute the code run Fixasc at a vim command propmpt

if exists('loaded_ToAsc_vim') | finish | endif
let loaded_ToAsc_vim = 1

function! s:FixAscii(line1,line2)
    let l:save_cursor = getpos(".")
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/[“”]/"/g'
    silent! execute ':' . a:line1 . ',' . a:line2 . "s/[‘’]/'/g"
	silent! execute ':' . a:line1 . ',' . a:line2 . 's/[–]/-/g'
    silent! execute ':' . a:line1 . ',' . a:line2 . "s/[—]/-/g"
    call setpos('.', l:save_cursor)
endfunction

" Run :Fixasc to substitute ascii quotes and hyphen for the unicode versions
command! -range=% Fixasc call <SID>FixAscii(<line1>,<line2>)

