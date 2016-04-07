" ============================================================================
" File:        syntax_checkers/encore/encore.vim
" Description: default encore syntax checker for syntastic.
" Maintainer:  Michael Lowell Roberts <mirobert at microsoft dot com>
" Version:     0.0.0
" License:     Microsoft Public License (Ms-PL)
" ============================================================================

if exists('g:loaded_syntastic_encore_checker')
    finish
endif
let g:loaded_syntastic_encore_checker = 1
if !exists('g:syntastic_encore_sort')
    let g:syntastic_encore_sort = 1
endif

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_encore_encore_IsAvailable() dict
"    Decho "self.getExec() => " . self.getExec()
    return executable(self.getExec())
endfunction

"function! SyntaxCheckers_encore_encore_GetHighlightRegex(item)
    "if match(a:item['text'], 'assigned but unused variable') > -1
        "let term = split(a:item['text'], ' - ')[1]
        "return '\V\\<'.term.'\\>'
    "endif

    "return ''
"endfunction

function! SyntaxCheckers_encore_encore_GetLocList() dict
    let makeprg = self.makeprgBuild({'args' : '-tc'})
    "let errorformat = '\ %#%f(line %l\\\,column %c):\ %m'
    let errorformat = '%-IImporting module %m,'
    let errorformat .= '%-I *** Error during typechecking ***,'
    let errorformat .= '%E"%f" (line %l\, column %c):,%m'
    let env = {}
    return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat, 'env': env })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
            \ 'filetype': 'encore',
            \ 'name': 'encore',
            \ 'exec': 'encorec' })

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set sw=4 sts=4 et fdm=marker:
