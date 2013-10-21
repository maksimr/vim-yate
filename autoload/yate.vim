if exists('g:autoloaded_yate')
	finish
endif

" Load yate snippets if installed vim-snipmate
if exists('g:snipMate')
	let g:snipMate.scope_aliases['yate'] = "yate,html"
endif

let g:autoloaded_yate = '1.0'
