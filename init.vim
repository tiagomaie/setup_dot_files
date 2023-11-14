
" autoinstall vim-plug NEOVIM
let plug_install = 0
let autoload_plug_path = stdpath('config') . '/autoload/plug.vim'
if !filereadable(autoload_plug_path)
    silent exe '!curl -fL --create-dirs -o ' . autoload_plug_path . ' https://raw.github.com/junegunn/vim-plug/master/plug.vim'
    "autocmd VimEnter * PlugInstall --sync | source $MYVIMR
    execute 'source ' . fnameescape(autoload_plug_path)
    let plug_install = 1
endif
unlet autoload_plug_path

" pluggins
call plug#begin('~/.config/nvim/plugins')

" R synchronous autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" TODO need to run: :CocInstall coc-r-lsp

" R integration
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}

" auto close quotes/brackets
Plug 'Raimondi/delimitMate'

" minimap on the side
" Plug 'wfxr/minimap.vim'

" bottom line information
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" directory tree
Plug 'preservim/nerdtree'

" theme
Plug 'rakr/vim-one'

" comment lines fast
Plug 'preservim/nerdcommenter'

" fuzzy file finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" lint engine
Plug 'dense-analysis/ale'

" display key bindings
Plug 'folke/which-key.nvim'


" Initialize plugin system
call plug#end()

if plug_install
    PlugInstall --sync
endif
unlet plug_install

" plugin options

" NCM2
"autocmd BufEnter * call ncm2#enable_for_buffer() " To enable ncm2 for all buffers.
"set completeopt=noinsert,menuone,noselect " :help Ncm2PopupOpen for more information.

" minimap
"let g:minimap_auto_start = 1
"let g:minimap_highlight_search = 1
"let g:minimap_highlight_range = 1
"hi MinimapCurrentLine ctermfg=Green guifg=#50FA7B guibg=#32302f
"let g:minimap_highlight = 'MinimapCurrentLine'

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

nnoremap <F6> :NERDTreeToggle<CR>
" Close NERDtree on open
let NERDTreeQuitOnOpen=1
" Show hidden files by default
let NERDTreeShowHidden=1

"
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" ALE R integration
" let g:ale_r_lintr_options = 'lintr::with_defaults(no_tab_linter=NULL)'
" let b:ale_exclude_highlights = ["Lines should not be"]
" disabling highlights as it slows down in big files
let g:ale_set_highlights = 0
highlight ALEWarning ctermbg=Black

" nvimr? setting better indentation
" set vim-r-plugin to 
let r_indent_align_args = 0

" Set vim-r-plugin to mimics ess :
let r_indent_ess_comments = 0
let r_indent_ess_compatible = 0

" R starts automatically when you load an R script while starting Vim
" let R_auto_start = 1

" set vim-r-plugin to write '<-' when '_' is pressed twice
let R_assign = 2

" show the arguments for functions with autocompletion
"let R_show_args = 1

" call R with the --no-save option
let R_args = ['--no-save']

" auto exit R if leaving nvim
autocmd VimLeave * if exists("g:SendCmdToR") && string(g:SendCmdToR) != "function('SendCmdToR_fake')" | call RQuit("nosave") | endif
let R_close_term = 0

" radian in nvim
let R_app = "radian"
let R_cmd = "R"
let R_hl_term = 0
let R_bracketed_paste = 1


" remap autocompletion Ctrl-x Ctrl-o to CxCx
inoremap <C-x><C-x> <C-x><C-o>

" R starting libs (doesnt seem to be working)
let R_start_libs = 'base,stats,graphics,grDevices,utils,methods,dplyr,ggplot2'


let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python2'
" let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_log"
" let $NVIM_PYTHON_LOG_LEVEL="INFO"





" **********************************************************************
" **********************************************************************
" **********************************************************************
" coc.nvim R sync completion setup
" **********************************************************************
" **********************************************************************
" **********************************************************************
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" Recently vim can merge signcolumn and number column into one
"set signcolumn=number
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" AirlineTheme setup
" let g:airline_theme='wombat'
" TODO sudo apt-get install fonts-powerline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
let g:airline_symbols.colnr = ' col:'
let g:airline_symbols.linenr = ' row:'
let g:airline_symbols.space = "\ua0"

" Theme setup
let g:airline_theme='one'
colorscheme one
set background=dark
set termguicolors


" whichkey setup
lua << EOF
  require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

" My mappings
inoremap <silent> %% <space>%>%<space>

" **********************************************************************
" **********************************************************************
" **********************************************************************
" **********************************************************************
" **********************************************************************

" +++++++++++
" SET OPTIONS
" +++++++++++

" UI CONFIG
syntax enable           " Enable syntax highlighting
set number              " show line numbers
set cursorline          " highlight current line
set showmatch           " highlight matching [{()}]
set mouse=a             " Enable mouse support in console
set colorcolumn=100      " max line width indicator
highlight ColorColumn ctermbg=0 guibg=lightgrey " color width indicator

" Diplay different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Files & Backup
" set nobackup             " Turn off backup.
" set nowb                 " Don't backup before overwriting a file.
" set noswapfile           " Don't create a swap file.

" Encoding
set encoding=utf-8       " Set utf8 as standard encoding and en_US as the standard language

" SPACE AND TABS
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2
set expandtab       " tabs are spaces
set noshiftround
filetype indent on      " load filetype-specific indent files
filetype on
filetype plugin on
set backspace=indent,eol,start " To make backscape work in all conditions
set smarttab        " Be smart when using tabs ;)
set autoindent " To copy indentation from current line when starting a new line
set si         "Smart indent

" Wrapping would distort the column-based layout.
" Lines must not be broken when typed.
setlocal nowrap textwidth=0
