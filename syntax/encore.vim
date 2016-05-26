" Vim syntax file
" Language: Encore
" Maintainer: Henrik Sommerland <henrik.sommerland@gmail.com>
"
" Based on a modified Dafny syntax script by Michael Lowell Roberts.
"
" In turn based on original Dafny syntax script by Kuat Yessenov.
" Copyright (C) Microsoft Corporation.  All Rights Reserved.
" Licensed under the Microsoft Public License (Ms-PL).
" See https://dafny.codeplex.com/license for more details.

if version < 600
  syntax clear
elseif exists("b:current_syntax") && b:current_syntax != "encore"
  finish
endif





" reset syntax highlighting for the current buffer.
syntax clear
" encore is case sensitive.
syntax case match



syntax keyword encoreClassType active passive trait
syntax keyword encoreFunction def
syntax keyword encoreTrait linear thread read subord unsafe
syntax keyword encoreTypeDef class typedef trait
syntax keyword encoreModifier passive
syntax keyword encoreModule bundle where import qualified 
syntax keyword encoreConditional if then else match case unless
syntax keyword encoreRepeat repeat <- while break for by in let
syntax keyword encoreKeyword matches with => new print ∊
syntax keyword encoreType string int bool void 
syntax keyword encoreBoolean true false null
syntax keyword encoreBlocking get fut
syntax keyword encoreEmbed embed body end
syntax keyword encoreOperator and not or 
                                           
syntax region encoreString start=/"/ skip=/\\"/ end=/"/

syntax match encoreComment "--.*"
syntax match encoreTypeThing ":\s\*\w\+"
syntax region encoreComment start="{-" end="-}"
syntax region encoreParam start="<\s*\w+" end=">"
syntax region encoreEmbed start="embed" end="body"


syntax match encoreNumber "\d\+"
syntax match encoreIdentifier /\<\w\+\>/
syntax match encoreClassName "[A-Z]\+\w\+"
syntax keyword encoreClassName this
syntax match encoreMaybe "Nothing"
syntax match encoreMaybe "Just"
syntax match encoreOperator "(\|λ\|¬\|∧\|∨\| )"


highlight link encoreFunction Function
highlight link encoreClassName Identifier
highlight link encoreMethod Statement
highlight link encoreModule StorageClass
highlight link encoreTypeDef Typedef
highlight link encoreConditional Conditional
highlight link encoreRepeat Repeat
highlight link encoreKeyword Keyword
highlight link encoreType Label
highlight link encoreTypeThing Label
highlight link encoreParam Label
highlight link encoreComment Comment
highlight link encoreString String
highlight link encoreNumber Number
highlight link encoreOperator Operator
highlight link encoreStatement Statement
highlight link encoreBoolean Boolean
highlight link encoreModifier Typedef 
highlight link encoreMaybe Boolean
highlight link encoreBlocking Exception
highlight link encoreEmbed PreCondit
"hi Conceal guibg=White guifg=DarkMagenta

" map to unicode symbols
inoremap <buffer> \\ \
inoremap <buffer> \ λ
inoremap <buffer> <- ←
inoremap <buffer> -> →
inoremap <buffer> <= ≤
inoremap <buffer> >= ≥
inoremap <buffer> != ≠
inoremap <buffer> => ⇒

iabbrev <buffer> not ¬
iabbrev <buffer> and ∧
iabbrev <buffer> or  ∨


"imap <buffer> .<space> ∙<space>
"imap <buffer> forall<space> ∀


" turn syntax highlight on for new symbols
syn match hsvarsym "(\|λ\|←\|→\|≤\|≥\|≡\|≠\| )"

if exists("s:loaded_ballercore")
	finish
endif
let s:loaded_ballercore = 1

augroup encorec
	autocmd bufreadpost *.enc cal s:readFromNormal()
	autocmd bufwritepre *.enc cal s:writeToNormal()
	autocmd bufwritepost *.enc cal s:readFromNormal()
augroup end

" function to convert ''fancy haskell source'' to haskell source
function s:writeToNormal()
	let s:line = line(".")
	let s:column = col(".")

	silent %s/λ/\\/eg
	silent %s/←/<-/eg
	silent %s/→/->/eg
	silent %s/≤/<=/eg
	silent %s/≥/>=/eg
"	silent %s/≡/==/eg
	silent %s/≠/!=/eg
	silent %s/⇒/=>/eg
	silent %s/¬/not/eg
	silent %s/∧/and/eg
	silent %s/∨/or/eg

	let &l:fileencoding = s:oldencoding
	call cursor(s:line,s:column)
endfunction

" function to convert haskell source to ''fancy haskell source''
function s:readFromNormal()
	let s:line = line(".")
	let s:column = col(".")

	let s:oldencoding = &l:fileencoding
	set fileencoding=utf-8

		silent %s/\\\s*(/λ(/eg
	silent %s/<-/←/eg
	silent %s/->/→/eg
	silent %s/<=/≤/eg
	silent %s/>=/≥/eg

"	silent %s/≡/==/eg
	silent %s/!=/≠/eg
	silent %s/=>/⇒/eg
	silent %s/>>/»/eg
	silent %s/\<not\>/¬/eg
	silent %s/\<and\>/∧/eg
	silent %s/\<or\>/∨/eg
	
	"&amp;"
   " silent %s/[^λ\\\-!#$%&*+/<=>?@\^|~.]\@<=\\\([^λ\\\-!#$%&*+/<=>\?@\^|~.]\)/λ\1/eg
   "silent %s/[^λ←→≲≳≡≠⇒»∙∀\\\-!#$%&*+/<=>?@\^|~.]\@<=\\\([^λ←→≲≳≡≠⇒»∙∀\\\-!#$%&*+/<=>\?@\^|~.]\)/λ\1/eg
		"    silent %s/[^λ←→≲≳≡≠⇒»∙∀\\\-!#$%&*+/<=>?@\^|~.]\@<=->\([^λ←→≲≳≡≠⇒»∙∀\\\-!#$%&*+/<=>\?@\^|~.]\)/→\1/eg
"    silent %s/[^λ←→≲≳≡≠⇒»∙∀\\\-!#$%&*+/<=>?@\^|~.]\@<=<-\([^λ←→≲≳≡≠⇒»∙∀\\\-!#$%&*+/<=>\?@\^|~.]\)/←\1/eg
"    silent %s/[^λ←→≲≳≡≠⇒»∙∀\\\-!#$%&*+/<=>?@\^|~.]\@<=<=\([^λ←→≲≳≡≠⇒»∙∀\\\-!#$%&*+/<=>\?@\^|~.]\)/≲\1/eg
"    silent %s/[^λ←→≲≳≡≠⇒»∙∀\\\-!#$%&*+/<=>?@\^|~.]\@<=>=\([^λ←→≲≳≡≠⇒»∙∀\\\-!#$%&*+/<=>\?@\^|~.]\)/≳\1/eg
"    silent %s/[^λ←→≲≳≡≠⇒»∙∀\\\-!#$%&*+/<=>?@\^|~.]\@<===\([^λ←→≲≳≡≠⇒»∙∀\\\-!#$%&*+/<=>\?@\^|~.]\)/≡\1/eg
"    silent %s/[^λ←→≲≳≡≠⇒»∙∀\\\-!#$%&*+/<=>?@\^|~.]\@<=\/=\([^λ←→≲≳≡≠⇒»∙∀\\\-!#$%&*+/<=>\?@\^|~.]\)/≠\1/eg
"    silent %s/[^λ←→≲≳≡≠⇒»∙∀\\\-!#$%&*+/<=>?@\^|~.]\@<==>\([^λ←→≲≳≡≠⇒»∙∀\\\-!#$%&*+/<=>\?@\^|~.]\)/⇒\1/eg
"    silent %s/[^λ←→≲≳≡≠⇒»∙∀\\\-!#$%&*+/<=>?@\^|~.]\@<=>>\([^λ←→≲≳≡≠⇒»∙∀\\\-!#$%&*+/<=>\?@\^|~.]\)/»\1/eg
"    silent %s/forall /∀/eg
"    silent %s/ \@<=\. /∙ /eg
    
	let &l:fileencoding = s:oldencoding
	call cursor(s:line,s:column)
endfunction

do encorec bufread
