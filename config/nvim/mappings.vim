" LEADER KEY
let g:mapleader = " "

" Abbreviations
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall


" resizing panes
nnoremap <leader>+ :resize +5
nnoremap <leader>- :resize -5

"Moving between splits with CRL-j/k/h/l"""
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
tnoremap <C-H> <C-\><C-N><C-W>h
tnoremap <C-J> <C-\><C-N><C-W>j
tnoremap <C-K> <C-\><C-N><C-W>k
tnoremap <C-L> <C-\><C-N><C-W>l

" create new splits
nnoremap <Leader>sh :split<CR>
nnoremap <Leader>sv :vsplit<CR>

" Jump back mapping
 nnoremap <C-[> :pop<CR>

" FZF
nnoremap <C-f> :Files<cr>
nnoremap <C-b> :Buffers<cr>
"nnoremap <C-a> :Ag<cr> " Mapping used by tmux
nnoremap <C-Space> :BLines<cr>
"
" Open Quickfix window
nnoremap <Leader>c :copen<CR>


" use `{` and `}` without affecting the jumplist
nnoremap <silent> { :keepjumps normal! {<CR>
nnoremap <silent> } :keepjumps normal! }<CR>


