" Yate - v0.0.1 - 2012-08-02
" http://github.com/
" Copyright (c) 2012 Maksim Ryzhikov; Licensed MIT

if exists("b:current_syntax")
	finish
endif

runtime! syntax/html.vim

syn case match
syn cluster yateTop contains=yateComment,yateReserved,yateAttributes,yateString add=yateCurlyBlock,yateRoundBlock
syn cluster yateTop contains=yateDebug,yateStatments,yateOperators,yateGlobal

syn region  yateCurlyBlock         start="{" end="}" contains=@yateTop containedin=htmlString contained
syn region  yateRoundBlock         start="(" end=")" contains=@yateTop

syn keyword yateTodo               FIXME NOTE TODO TBD OPTIMIZE XXX contained
syn keyword yateReserved           match apply func key include
syn keyword yateConditional        if else
syn keyword yateRepeat             for
syn keyword yateType               nodeset boolean scalar attr xml containedin=yateRoundBlock contained
syn match   yateOperators          "&&"
syn match   yateAttributes         "@[A-Za-z_-]\+"
syn match   yateSelector           "\.[A-Za-z][A-Za-z0-9_-]\+"
syn match   yateMode               "\([match\|apply]\s\+\.[A-Za-z][A-Za-z0-9_-]\+\s\+\)\@<=[A-Za-z_-]\+"
syn match   yateMode               "\([match\|apply]\s\+[\./]\s\+\)\@<=[A-Za-z_-]\+"
syn keyword yateDebug              console print log
syn keyword yateGlobal             name count exists

syn region  yateString             start=+"+ end=+"+ contains=@Spell,yateCurlyBlock,yateRoundBlock containedin=yateCurlyBlock,yateRoundBlock
syn region  yateString             start=+'+ end=+'+ contains=@Spell,yateCurlyBlock,yateRoundBlock containedin=yateCurlyBlock,yateRoundBlock

syn region  yateComment            start="/\*" end="\*/" contains=yateTodo
syn match   yateComment            "//.*" contains=@Spell,yateTodo


command! -nargs=+ HiLink hi def link <args>
HiLink yateComment                 Comment
HiLink yateReserved                Function
HiLink yateConditional             Conditional
HiLink yateRepeat                  Repeat
HiLink yateOperators               Normal
HiLink yateType                    Type
HiLink yateGlobal                  Special

HiLink yateAttributes              Type
HiLink yateString                  String
HiLink yateSelector                Normal
HiLink yateDebug                   Debug
HiLink yateTodo                    Todo
HiLink yateMode                    Normal
delcommand HiLink


let b:current_syntax = "yate"
