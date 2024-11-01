" EDITOR SETTINGS
"
" ensure vim instead of vi settings
set nocompatible

" GRAPHIC USER INTERFACE
"
set wildmenu
"display partial commands in the status line
set showcmd
colorscheme desert

"optimization
"don't redraw screen wehn executiong macros
set lazyredraw
"visualize line the cursor is currently in
set cursorline
hi clear CursorLine
"highlight all machtech son screen when searching - 
set hlsearch
"display some special characters
set list
set listchars=
"display tabs as ">--------"
set listchars+=tab:>-
"display trailing whitespaces as "-"
set listchars+=trail:-
"show line numbers
set number

syntax enable

"MAPPING    
inoremap jk <esc>
noremap YY :x <CR>

set backspace=2 "make backspace work like most other programs

"when splitting vertically put the new window right of current
if has('vertsplit')
	set splitright
endif



" # AUTOCOMPLETE #
" # python:
" packadd! python-jedi

"increase history of execution commands (:) and search patterns (/)
set history=1000
"increase number of possible undos
set undolevels=1000

" TABS AND SPACES
set shiftwidth=4
set softtabstop=4
set expandtab
" enable autoindention
set autoindent

