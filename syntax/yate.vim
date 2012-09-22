" Yate - v0.0.2 - 2012-09-22
" http://github.com/
" Copyright (c) 2012 Maksim Ryzhikov; Licensed MIT


if exists("b:current_syntax")
	finish
endif

" Read and execute commands from
" all[!] source files for html syntax
runtime! syntax/html.vim

" Unlet buffer variable 'current_syntax'
" if it was let by a html source file
unlet! b:current_syntax

" next instruction 'syn' will be case sensitive
syn case match

" special words contained only
" in comments
syn keyword yateTodo FIXME NOTE TODO TBD OPTIMIZE XXX contained containedin=@yateComment

" ----------
" single-line comment
syn region yateComment start=+//+ end=+$+
" multi-line comment
syn region yateComment start=+/\*+ end=+\*/+
" cluster for comments
syn cluster yateComment contains=yateComment

" ----------
" reserved yate keywords
syn keyword yateReserved match apply func key include
" build-in yate functions
syn keyword yateBuildIn true false
syn keyword yateBuildIn count name exists number string
syn keyword yateDebug log

" ----------
" body and block
" contains=TOP - contains group
" which do not have argument 'contained'.
" Body contained in string(interpolation) and html string
syn region yateBody start=+{+ end=+}+ contains=TOP containedin=@yateBodyContainer
syn region yateBody2 start=+(+ end=+)+ contains=TOP containedin=@yateBodyContainer
syn cluster yateBody contains=yateBody,yateBody2
" Cluster which contains groups that contains yateBod
syn cluster yateBodyContainer contains=@yateString,htmlString

" ----------
" Primitive type
" excludenl - quotes should be on single-line
syn region  yateString excludenl start=+"+ end=+"+
syn region  yateString excludenl start=+'+ end=+'+
syn cluster yateString contains=yateString

" ----------
" Attributes, types of template parameters and operators
syn match   yateAttribute "@[A-Za-z_-]\+"
syn keyword yateParameterType nodeset boolean scalar attr xml contained containedin=yateBody2
syn match   yateOperators "&&\|<[=]*\|>[=]*\|[|]\{1,2\}" contained containedin=yateBody2

" ----------
" Control statements
syn keyword yateConStat if else
syn keyword yateConStatLoop for
syn cluster yateControl contains=yateConStat,yateConStatLoop

" ----------
" Extend htmlTop cluster
syn cluster htmlTop add=@yateComment,@yateBody,@yateControl
syn cluster htmlTop add=yateReserved,yateBuildIn,yateDebug,yateAttribute

" Extend Spell cluster (resolve problem with link tag)
syn cluster Spell add=@yateComment,@yateBody,@yateControl
syn cluster Spell add=yateReserved,yateBuildIn,yateDebug,yateAttribute

command! -nargs=+ HiLink hi def link <args>
HiLink yateTodo Todo
HiLink yateComment Comment
HiLink yateReserved Function
HiLink yateBuildIn Special
HiLink yateDebug Debug
HiLink yateString String
HiLink yateAttribute Type
HiLink yateParameterType Type
HiLink yateOperators Normal
HiLink yateConStat Conditional
HiLink yateConStatLoop Repeat
HiLink yateJPath Normal
delcommand HiLink

let b:current_syntax = "yate"
