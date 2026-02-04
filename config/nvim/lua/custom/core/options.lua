-- See `:help mapleader`
-- Sets the leader key to the spacebar. The leader key is a prefix for custom keybindings.
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '

-- Also set the local leader key to the spacebar.
-- See `:help maplocalleader`
vim.g.maplocalleader = ' '

-- A global variable to indicate whether a Nerd Font is installed and should be used for icons.
vim.g.have_nerd_font = true

-- See `:help 'number'`
-- Shows line numbers on the left side of the editor.
vim.opt.number = true

-- See `:help 'relativenumber'`
-- Shows line numbers relative to the cursor's current line. Helps with vertical navigation.
vim.opt.relativenumber = true

-- See `:help 'mouse'`
-- Enables mouse support in all modes.
vim.opt.mouse = 'a'

-- See `:help 'showmode'`
-- Hides the default mode indicator, as it is usually included in the status line.
vim.opt.showmode = false

-- See `:help 'clipboard'`
-- Syncs the system clipboard with Neovim's registers. Allows for copy/paste between Neovim and other applications.
vim.opt.clipboard = 'unnamedplus'

-- See `:help 'breakindent'`
-- Maintains indentation when a line is wrapped.
vim.opt.breakindent = true

-- See `:help 'undofile'`
-- Saves undo history to a file, so it persists across Neovim sessions.
vim.opt.undofile = true

-- See `:help 'ignorecase'`
-- Makes searching case-insensitive.
vim.opt.ignorecase = true

-- See `:help 'smartcase'`
-- Overrides 'ignorecase' if the search query contains any uppercase letters.
vim.opt.smartcase = true

-- See `:help 'signcolumn'`
-- Always shows the sign column, preventing the editor from shifting when signs (e.g., from Git or LSP) are added.
vim.opt.signcolumn = 'yes'

-- See `:help 'updatetime'`
-- Sets the delay in milliseconds before CursorHold event is triggered and swap files are written.
vim.opt.updatetime = 250

-- See `:help 'timeoutlen'`
-- Sets the time in milliseconds to wait for a mapped sequence to complete.
vim.opt.timeoutlen = 300

-- See `:help 'splitright'`
-- Opens new vertical splits to the right of the current window.
vim.opt.splitright = true

-- See `:help 'splitbelow'`
-- Opens new horizontal splits below the current window.
vim.opt.splitbelow = true

-- See `:help 'list'`
-- Enables the display of whitespace characters.
vim.opt.list = false

-- See `:help 'listchars'`
-- Defines the characters to use for displaying tabs, trailing whitespace, and non-breaking spaces.
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- See `:help 'inccommand'`
-- Shows a live preview of substitution commands.
vim.opt.inccommand = 'split'

-- See `:help 'cursorline'`
-- Highlights the line where the cursor is currently located.
vim.opt.cursorline = true

-- See `:help 'scrolloff'`
-- Keeps a minimum number of screen lines visible above and below the cursor.
vim.opt.scrolloff = 10

-- See `:help 'visualbell'`
-- Uses a visual indicator (flash) instead of a sound for alerts.
vim.opt.visualbell = true

-- Disables the built-in netrw file explorer, as nvim-tree is used instead.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- See `:help 'expandtab'`
-- Use spaces instead of tab characters.
vim.opt.expandtab = true

-- See `:help 'shiftwidth'`
-- Number of spaces to use for each step of (auto)indent.
vim.opt.shiftwidth = 4

-- See `:help 'tabstop'`
-- Number of spaces that a tab in the file counts for.
vim.opt.tabstop = 4

-- See `:help 'softtabstop'`
-- Number of spaces that a <Tab> counts for. When 0, the value of 'tabstop' is used.
vim.opt.softtabstop = 4

-- See `:help 'smarttab'`
-- When on, a <Tab> in front of a line inserts 'shiftwidth' spaces. When off, a <Tab> always inserts 'tabstop' spaces.
vim.opt.smarttab = false
