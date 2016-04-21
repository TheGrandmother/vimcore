" ============================================================================
" File:        ftdetect/encore.vim
" Description: Encore filetype detection script for vim.
" Maintainer:  Henrik Sommerland <henrik.sommerland@gmail.com>
" Version:     0.0.0
" License:     Microsoft Public License (Ms-PL)
" ============================================================================

au BufEnter,BufRead,BufNewFile *.enc set filetype=encore expandtab shiftwidth=2
au BufEnter,BufRead,BufNewFile *.enc call Encore_map()
au BufLeave  *.enc call Encore_unmap()

let s:encore_is_mapped=0

function! Encore_map()
  if !(s:encore_is_mapped == 0)
    nmap <leader>ec ^i--<ESC>
    nmap <leader>eC ^2"_dl
    vmap <leader>ec <ESC>`<0<C-v>`>0I--<ESC>
    vmap <leader>eC <ESC>`<^<C-v>`>^l"_d<ESC>

    noremap <leader>- /<++><CR>4cl
    imap <c-_>  <ESC>/<++><CR>4cl

    map <leader>ed i<TAB>def <++>(<++>): <++> {<CR><TAB><++><CR><ESC>2"_dhi}<ESC><ESC>2k/<++><CR>4cl
    map <leader>er irepeat <++> <- <++> {<CR><TAB><++><CR><ESC>2"_dhi}<ESC><ESC>2k/<++><CR>4cl
    map <leader>ef ifor <++> in <++> {<CR><TAB><++><CR><ESC>2"_dhi}<ESC><ESC>2k/<++><CR>4cl
    map <leader>ei iif <++> then {<CR><TAB><++><CR><ESC>2"_dhi}<ESC>2k/<++><CR>4cl
    map <leader>eie iif <++> then {<CR><TAB><++><CR><ESC>2"_dhi}else{<CR><TAB><++><CR><ESC>2"_dhi}<ESC><ESC>4k/<++><CR>4cl
    map <leader>em imatch <++> with<CR><TAB><++> => <++><ESC>1k^/<++><CR>4cl

    let s:encore_is_mapped=1
  endif
endfunction

function! Encore_unmap()
  if (s:encore_is_mapped == 1)
    unmap <leader>ec
    unmap <leader>eC
    unmap <leader>-
    unmap <leader>ed
    unmap <leader>er
    unmap <leader>ef
    unmap <c-_>
    unmap <leader>ei
    unmap <leader>eie
    unmap <leader>em
    let s:encore_is_mapped=0
  endif
endfunction

