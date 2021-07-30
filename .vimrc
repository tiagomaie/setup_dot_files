" LINES THAT BEGIN WITH " ARE COMMENTS AND ARE NOT READ BY VIM


" autoinstall vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" most lines taken from:
"   http://dougblack.io/words/a-good-vimrc.html
"   https://amix.dk/vim/vimrc.html


" COLORS AND FONTS
" Set color scheme
"set termguicolors "not working atm
syntax enable           " enable syntax processing
set term=xterm-256color " Setting compatible terminal
set t_Co=256
set background=dark
set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum
"colorscheme evening         " awesome color-scheme
"colorscheme taffy
"colorscheme solarized8
"let g:lightline = { 'colorscheme': 'taffy' }

set encoding=utf8       " Set utf8 as standard encoding and en_US as the standard language
set smarttab        " Be smart when using tabs ;)
set ai "Auto indent
set si "Smart indent
" Wrapping would distort the column-based layout.
" Lines must not be broken when typed.
setlocal nowrap textwidth=0


" SPACE AND TABS
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2
set expandtab       " tabs are spaces
set noshiftround
filetype indent on      " load filetype-specific indent files
filetype on
filetype plugin on

set backspace=indent,eol,start


" Cool tab completion stuff
" set wildmenu
" set wildmode=list:longest,full

" UI CONFIG
set number      " show line numbers
set cursorline          " highlight current line
set showcmd             " show command in bottom bar
set title "Set the window's title, reflecting the file currently being edited.
set ruler "Always show cursor position
set showmatch "highlight matching [{()}]
set mouse=a " Enable mouse support in console
set colorcolumn=80 " max line width indicator
highlight ColorColumn ctermbg=0 guibg=lightgrey " color width indicator

" Diplay different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.


" Status bar
"set laststatus=2
"set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]
"set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0


"let g:airline_theme='wombat'



" Searching {{{
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
" }}}


" pluggins
call plug#begin('~/.vim/plugged')
" R integration
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
" minimap on the side
Plug 'wfxr/minimap.vim'
" bottom line information
Plug 'vim-airline/vim-airline'
" directory tree
Plug 'preservim/nerdtree'
" comment lines fast
Plug 'preservim/nerdcommenter'
" fuzzy file finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" lint engine
Plug 'dense-analysis/ale'

" Initialize plugin system
call plug#end()


" plugin options

" minimap
let g:minimap_auto_start = 1
let g:minimap_highlight_search = 1
let g:minimap_highlight_range = 1
hi MinimapCurrentLine ctermfg=Green guifg=#50FA7B guibg=#32302f
let g:minimap_highlight = 'MinimapCurrentLine'

" nerdcommenter
" Create default mappings
let g:NERDCreateDefaultMappings = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" nerdtree
" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p
"
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" ALE R integration
" let g:ale_r_lintr_options = 'lintr::with_defaults(no_tab_linter=NULL)'

" nvimr? setting better indentation
" set vim-r-plugin to 
let r_indent_align_args = 0

" Set vim-r-plugin to mimics ess :
let r_indent_ess_comments = 0
let r_indent_ess_compatible = 0

" set vim-r-plugin to write '<-' when '_' is pressed twice
let R_assign = 2


" Do ':PlugInstall' within Vim to install plugins
