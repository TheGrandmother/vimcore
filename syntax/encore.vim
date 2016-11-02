" Vim syntax file
" Language: Encore
" Maintainer: Henrik Sommerland <henrik.sommerland@gmail.com>
"             Lucas Arnström <lucas@arnstrom.se>
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

syntax keyword encoreFunction def
syntax keyword encoreTrait linear thread read subord unsafe
syntax keyword encoreTypeDef class typedef trait
syntax keyword encoreModifier passive require
syntax keyword encoreModule bundle where import qualified
syntax keyword encoreConditional if then else match case unless
syntax keyword encoreRepeat repeat <- while break for by in let
syntax keyword encoreKeyword matches with when => new print println
syntax keyword encoreType string uint int bool void real
syntax keyword encoreBoolean true false null
syntax keyword encoreBlocking get fut
syntax keyword encoreEmbed embed body end
syntax keyword encoreOperator and not or

syntax region encoreString start=/"/ skip=/\\"/ end=/"/

syntax match encoreComment "--.*\|//.*"
syntax match encoreTypeThing ":\s\*\w\+"
syntax region encoreComment start="{-" end="-}"
syntax region encoreComment start="/\*" end="\*/"
syntax region encoreParam start="<\s*\w+" end=">"
syntax region encoreEmbed start="embed" end="end"

syntax match encoreNumber "\d\+"
syntax match encoreIdentifier /\<\w\+\>/
syntax match encoreClassName "[A-Z]\+\w\+"
syntax keyword encoreClassName this
syntax match encoreMaybe "Nothing"
syntax match encoreMaybe "Just"
syntax match encoreOperator "(\|)"

highlight link encoreFunction Function
highlight link encoreClassName Identifier
highlight link encoreTrait Statement
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
