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
"highlight all machtech son screen when searching - 
set hlsearch
"display some special characters
set list
set listchars=
"display tabs as ">--------"
set listchars+=tab:>-
"display trailing whitespaces as "-"
set listchars+=trail:-

syntax enable

"MAPPING    
inoremap jk <esc>



"when splitting vertically put the new window right of current
if has('vertsplit')
	set splitright
endif



" autocompletion
set wildmode=list:longest,full
"ignore case when completing files,...
if exists('+wildignorecase')
	set wildignorecase
endif
" already display matches while typing search command
set incsearch


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

