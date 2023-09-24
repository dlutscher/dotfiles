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

" go-vim
let g:go_imports_autosave = 1 " Auto add imports on save for Golang files.


"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


"""""""""THEME SETTINGS""""""""""""
filetype plugin indent on
syntax on
let $BAT_THEME="Nord"

" use nord color theme
colorscheme nord

" Airline
let g:airline_theme='nord'
let g:lightline = { 'colorscheme': 'nord' }
