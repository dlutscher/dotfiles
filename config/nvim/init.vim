let g:python3_host_prog=$HOME.'/.pyenv/versions/3.7.4/bin/python'

" Required:
call plug#begin('~/.local/share/nvim/plugged')

"Treesitter for syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" for python indentation according to pep8
Plug 'Vimjas/vim-python-pep8-indent'

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'psf/black', { 'branch': 'stable' }

" for improved navigation in nvim
Plug 'nvim-lua/plenary.nvim' " pre-requisite for `harpoon`
Plug 'ThePrimeagen/harpoon'

" File management
Plug 'scrooloose/nerdtree'

" automatic window resizing
" Plug 'beauwilliams/focus.nvim'

" vim / tmux integration, needed to send commands
" from nvim to other pane
Plug 'jpalardy/vim-slime'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jalvesaq/vimcmdline'

" Formatting
" highlights trailing whitespaces
Plug 'ntpeters/vim-better-whitespace'

" for aligning text
" especially useful for copy-pasted texts
" https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Comment/Uncomment tool
Plug 'scrooloose/nerdcommenter'

" multi cursor plugin
" https://github.com/terryma/vim-multiple-cursors
Plug 'terryma/vim-multiple-cursors'

" Git
" great tool to use git features inside neovim
Plug 'tpope/vim-fugitive'

" shows a git diff in the sign column
Plug 'airblade/vim-gitgutter'

" Auto-close braces and scopes
Plug 'jiangmiao/auto-pairs'

" fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" cool status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" onedark color scheme
Plug 'joshdick/onedark.vim'

" for improved jumping behaviour (using [], [m, ...)
Plug 'jeetsukumaran/vim-pythonsense', { 'for': 'python' }

call plug#end()

" source the other .vim files
source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/mappings.vim
"source $HOME/.config/nvim/custom.vim

for f in split(glob('$HOME/.config/nvim/plugins/*.vim'), '\n')
  exe 'source' f
endfor


" Color and syntax highlighting
filetype plugin indent on
syntax on
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256
colorscheme onedark

" Airline
let g:airline_theme='onedark'
" User powerline symbols in Airline
let g:airline_powerline_fonts = 1


" Split windows
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l


" This adds the syntaix highlighting for treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
