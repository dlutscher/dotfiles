"=====================================================
" Slime settings
"=====================================================
let g:slime_python_ipython = 1
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
let g:slime_dont_ask_default = 1
let g:slime_preserve_curpos = 0

" Add custom slime mappings
let g:slime_no_mappings = 1
nmap <c-x><c-v> <Plug>SlimeConfig
" mnemonic: hold CTRL, then <c><v> just like copy/pasting
xmap <c-x><c-x> <Plug>SlimeRegionSend
nmap <c-x><c-x> <Plug>SlimeParagraphSend
