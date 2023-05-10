" Coc configuration
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gv :vsp<CR><Plug>(coc-definition)<C-W>L
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

vmap <leader>a <Plug>(coc-codeaction-selected)<CR>
nmap <leader>a <Plug>(coc-codeaction-selected)<CR>



let g:coc_global_extensions = [
  \ 'coc-spell-checker',
  \ 'coc-prettier',
  \ 'coc-git',
  \ 'coc-tsserver',
  \ 'coc-pyright',
  \ 'coc-markdownlint',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-go',
  \ 'coc-docker',
  \ 'coc-css',
  \ 'coc-clangd',
  \ 'coc-yaml',
  \ 'coc-sh',
  \ 'coc-highlight',
  \ ]
" Required:
call plug#begin('~/.local/share/nvim/plugged')

"Treesitter for syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" cool status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" onedark color scheme
Plug 'joshdick/onedark.vim'
" nord color theme
Plug 'arcticicestudio/nord-vim'

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

" User powerline symbols in Airline
let g:airline_powerline_fonts = 1


" Split windows
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l


" This adds the syntaix highlighting for treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  --  ensure_installed = "maintained",
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
        -- disable = {"python"}
    },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.md = {
  install_info = {
    url = "https://github.com/MDeiml/tree-sitter-markdown",
    branch = "main",
    files = { "src/parser.c", "src/scanner.cc" }
  },
  maintainers = { "@MDeiml" },
}
EOF
