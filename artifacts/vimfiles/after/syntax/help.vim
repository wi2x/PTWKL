" VIM syntax file
" Language:		Vim help file
" Maintainer:	pb2q
" Last Change:
"
" This syntax file for help files adds some special formatting options for
" 	help files.

" syn match helpBoldTerm		"\~.*\~" contains=helpTilde
syn match helpBoldTerm			"\\\@<!\~[^"*\~]\+\~" contains=helpTilde
syn match helpTickBoldTerm		"\\\@<!`[^"*`]\+`" contains=helpTick

syn match helpTilde		contained "\~"
syn match helpTick		contained "`"

hi def link helpBoldTerm		String
hi def link helpTildeBoldTerm	Comment
hi def link helpTilde			Ignore
hi def link helpTick				Ignore


