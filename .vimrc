" LINES THAT BEGIN WITH " ARE COMMENTS AND ARE NOT READ BY VIM


" most lines taken from:
"   http://dougblack.io/words/a-good-vimrc.html
"   https://amix.dk/vim/vimrc.html


" COLORS AND FONTS
colorscheme evening         " awesome colorscheme
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

" Searching {{{
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
" }}}
