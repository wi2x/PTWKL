

"
" vi config file a la pb2q
"
"

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2002 Sep 19
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc


" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif


" Tim Pope's pathgen plugin for loading vim bindles:
call pathogen#infect()


" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif


" Mappings:

" turn off those pesky arrow keys:
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
cnoremap <up> <nop>
cnoremap <down> <nop>
cnoremap <left> <nop>
cnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>
vnoremap <right> <nop>


" Use Alt-f to insert the current filename (no path):
noremap <M-f> <C-R>=expand("%:t")<CR>


" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

function! GuiTabLabel()
    return fnamemodify(bufname(winbufnr(1)), ":t")
endfunction
set guitablabel=%!GuiTabLabel()


set tabstop=3
set cindent shiftwidth=3
set hidden
set vb t_vb=			" no beeping

set ignorecase
set smartcase
set nowrap


set wildmenu
set wildmode=longest,full
set wildchar=<Tab> 


set history=50		" keep 50 lines of command line history
set ruler			" show the cursor position all the time
set showcmd			" display incomplete commands
set incsearch		" do incremental searching


set statusline=%<%f\ (b%n)\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set laststatus=2	" status line will always be on

set splitright


set fileformats=unix,mac,dos

 
set background=dark


"colorscheme mywombat
colorscheme solarized


runtime ftplugin/changelog.vim


command Fu call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)

command! Cdcf	cd c:\Users\patrick\projects\CareForm\CareForm\src\Careform\Careform
command! Cdts	cd c:\Users\patrick\projects\TolmarSync\TolmarSync\src\TolmarSync\TolmarSync
command! Cdsc	cd c:\Users\patrick\projects\SynviscConnect\SynviscConnect\src\Synvisc\Synvisc
command! Cdbvp	cd c:\Users\patrick\projects\projects\BenefitsVerification\BenefitsVerification\src\BenefitVerification\BenefitVerificationPortal



" System: system-specific switches, mainly for filesystem differences on
" 	windows.
" could check for the existence of these dirs and warn if not there, or create
" 	them
if has ('win32')
	set dir=C:\\Users\\patrick\\tmp\\viSwaps//
	set backupdir=C:\\Users\\patrick\\tmp\\viBackups//
	let MRU_File = 'C:\Users\patrick\_vim_mru_files'
else
	set dir=~/tmp/.viSwaps,.
	set backupdir=~/tmp/.viSwaps,.
endif	" win32 specifics



" GUI: gui specific switches
if has('gui_running')
	set guioptions-=m		" no menubars
	set guioptions-=r		" no righthand scrollbars
	set guioptions-=R		" no righthand scrollbars
	set guioptions-=l		" no lefthand scrollbars
	set guioptions-=L		" no lefthand scrollbars
	set guioptions-=T		" no toolbars
	set cursorline

	if has ('win32')
		set guifont=Lucida_Console:h8
		" actually these numbers are DISPLAY specific
		set lines=82
		set columns=231
	elseif has ('mac')
		set guifont=Monaco:h9
		" actually these numbers are DISPLAY specific
		set lines=69
		set columns=237
	endif	" os selection

endif	" gui_running



" VIM Version: version specific code			.
if version >= 700
	" code for specific vim version
endif



" Autocommands: commands executed when reading, writing certain files or
" 	buffers.
" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on


  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!


  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78


  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif


  " pb2q
  " should use a variable for mywombat, used twice now
  "autocmd VimEnter * colorscheme mywombat
  autocmd VimEnter * colorscheme solarized


  " used to generate new helptags each time I edit my tips file:
  autocmd BufWrite	pb2qVimTips.txt			:helptags ~/.vim/doc/
  autocmd BufRead		pb2qVimTips.txt			set filetype=help
  autocmd BufRead		pb2qVimTips.txt			set noreadonly
  autocmd BufRead		pb2qVimTips.txt			set modifiable

  autocmd BufWrite	pb2qDevTips.txt			:helptags ~/.vim/doc/
  autocmd BufRead		pb2qDevTips.txt			set filetype=help
  autocmd BufRead		pb2qDevTips.txt			set noreadonly
  autocmd BufRead		pb2qDevTips.txt			set modifiable

  autocmd BufWrite	pb2qGoLog.txt				:helptags ~/.vim/doc/
  autocmd BufRead		pb2qGoLog.txt				set filetype=help
  autocmd BufRead		pb2qGoLog.txt				set noreadonly
  autocmd BufRead		pb2qGoLog.txt				set modifiable

  autocmd BufWrite	pb2qComputerTips.txt		:helptags ~/.vim/doc/
  autocmd BufRead		pb2qComputerTips.txt		set filetype=help
  autocmd BufRead		pb2qComputerTips.txt		set noreadonly
  autocmd BufRead		pb2qComputerTips.txt		set modifiable


  " I want some files to behave like ChangeLogs, even when they aren't named
  " 	'ChangeLog':
  autocmd BufRead		exerciseNotes.txt			setfiletype ChangeLog
  autocmd BufNewFile	exerciseNotes.txt			setfiletype ChangeLog

  autocmd BufRead		devJournal.txt				setfiletype ChangeLog
  autocmd BufNewFile	devJournal.txt				setfiletype ChangeLog


  " asp shite:
  autocmd BufRead		*.aspx						setfiletype html
  autocmd BufNewFile	*.aspx						setfiletype html
  autocmd BufRead		*.ascx						setfiletype html
  autocmd BufNewFile	*.ascx						setfiletype html


  " razor shite:
  autocmd BufRead		*.cshtml						setfiletype html
  autocmd BufNewFile	*.cshtml						setfiletype html
  autocmd BufRead		*.cshtml						setfiletype html
  autocmd BufNewFile	*.cshtml						setfiletype html



  autocmd BufRead		*.dconfig					setfiletype xml
  autocmd BufNewFile	*.dconfig					setfiletype xml


  augroup END


else

  set autoindent		" always set autoindenting on

endif " has("autocmd")


