let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

"=====================================================
" EDITOR settings
"=====================================================
""""""GENERAL""""""
set clipboard+=unnamedplus
set completeopt-=preview
set noshowmode
set lazyredraw
set nofoldenable
set hidden
set noswapfile
set number                     " Show line numbers
set relativenumber
set ignorecase
set smartcase
set magic
set showmatch
set nobackup
set nowritebackup
set nowb
set noerrorbells
set updatetime=300
set nowrap

"set linebreak                  " Break lines at word (requires Wrap lines)
"set showbreak=+++              " Wrap-broken line prefix
"set textwidth=90               " Line wrap (number of cols)
set colorcolumn=99
set visualbell                 " Use visual bell (no beeping)
set expandtab                  " Use spaces instead of tabs
set shiftwidth=2               " Number of auto-indent spaces
set smartindent                " Enable smart-indent
set softtabstop=2              " Number of spaces per Tab
set undolevels=1000            " Number of undo levels
set splitright
set shortmess+=c
set signcolumn=yes
set scrolloff=7


"""""""""THEME SETTINGS""""""""""""
filetype plugin indent on
syntax on
let $BAT_THEME="Nord"

"set background=dark
"colorscheme one
" set background=dark
" let g:onedark_terminal_italics=1
" let g:onedark_termcolors=256
" colorscheme onedark

" use nord color theme
colorscheme nord

" use iceberg color theme
" colorscheme iceberg

" Airline
let g:airline_theme='nord'
let g:lightline = { 'colorscheme': 'nord' }
