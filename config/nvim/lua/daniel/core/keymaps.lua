vim.g.mapleader = " "

local keymap = vim.keymap
local opts = { silent = true }

-- general


-------------------------
-- insert mode keymaps --
-------------------------

-- jk will be same as escape key
keymap.set("i", "jk", "<ESC>")


--------------------------
-- normal mode keymaps ---
--------------------------

-- shortcut for "no highlighting"
keymap.set("n", "<leader>nh", ":nohl<CR>", opts)

-- removes character like 'x' but doesnt save it to register
keymap.set("n", "x", '"_x', opts)
keymap.set("n", "s", '"_s', opts)

-- increment / decrement numbers
keymap.set("n", "<leader>+", "<C-a>", opts)
keymap.set("n", "<leader>-", "<C-x>", opts)

-- shortcuts for splitting windows
keymap.set("n", "<leader>sv", "<C-w>v", opts) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", opts) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>", opts) -- close current split window

-- shortcuts for opening tabs
keymap.set("n", "<leader>to", ":tabnew<CR>", opts) -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>", opts) -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>", opts) -- go not previous tab


--- plugin keymaps ---
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts) -- maximizes current split window

keymap.set("n", "<C-p>", ":NvimTreeToggle<CR>", opts)

-- telescope
keymap.set("n", "<C-f>", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>ps", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>*", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<C-b>", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
