" LINES THAT BEGIN WITH " ARE COMMENTS AND ARE NOT READ BY VIM


" most lines taken from:
"   http://dougblack.io/words/a-good-vimrc.html
"   https://amix.dk/vim/vimrc.html


" COLORS AND FONTS
colorscheme evening         " awesome color-scheme
syntax enable           " enable syntax processing
set encoding=utf8       " Set utf8 as standard encoding and en_US as the standard language
set smarttab        " Be smart when using tabs ;)
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" SPACE AND TABS
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
filetype indent on      " load filetype-specific indent files


" UI CONFIG
set number      " show line numbers
set cursorline          " highlight current line
set showcmd             " show command in bottom bar
set title "Set the window's title, reflecting the file currently being edited.
set ruler "Always show cursor position

" Searching {{{
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
" }}}

" MISC
set history=1000 "Increase the undo limit.
set confirm "Display a confirmation dialog when closing an unsaved file.
set spell "Enable spell-checking.
