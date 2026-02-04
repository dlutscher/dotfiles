return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local fzf = require('fzf-lua')

    fzf.setup({
      'default-title', -- Use default title profile (modern look)
      winopts = {
        height = 0.85,
        width = 0.80,
        row = 0.35,
        col = 0.50,
        preview = {
          layout = 'flex',
          flip_columns = 120, -- horizontal preview if columns > 120
        },
      },
      keymap = {
        fzf = {
          ['ctrl-q'] = 'select-all+accept', -- send all to quickfix
        },
      },
      files = {
        prompt = 'Files❯ ',
        git_icons = true,
        file_icons = true,
      },
      grep = {
        prompt = 'Grep❯ ',
        git_icons = true,
        file_icons = true,
      },
    })

    -- File finding
    vim.keymap.set('n', '<C-f>', fzf.files, { desc = 'Find files' })
    vim.keymap.set('n', '<leader>pf', fzf.files, { desc = '[P]roject [F]iles' })

    -- Grep/search
    vim.keymap.set('n', '<leader>ps', fzf.live_grep, { desc = '[P]roject [S]earch (grep)' })
    vim.keymap.set('n', '<leader>pw', fzf.grep_cword, { desc = '[P]roject search [W]ord under cursor' })
    vim.keymap.set('n', '<leader>pW', fzf.grep_cWORD, { desc = '[P]roject search [W]ORD under cursor' })

    -- Buffers and recent
    vim.keymap.set('n', '<leader><leader>', fzf.buffers, { desc = 'Find buffers' })
    vim.keymap.set('n', '<leader>fr', fzf.oldfiles, { desc = '[F]ind [R]ecent files' })

    -- Search helpers
    vim.keymap.set('n', '<leader>sh', fzf.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', fzf.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sd', fzf.diagnostics_document, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', fzf.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>/', fzf.blines, { desc = '[/] Search in buffer' })

    -- Git
    vim.keymap.set('n', '<leader>gc', fzf.git_commits, { desc = '[G]it [C]ommits' })
    vim.keymap.set('n', '<leader>gs', fzf.git_status, { desc = '[G]it [S]tatus' })

    -- LSP
    vim.keymap.set('n', '<leader>ca', fzf.lsp_code_actions, { desc = '[C]ode [A]ctions' })
    vim.keymap.set('n', 'gd', fzf.lsp_definitions, { desc = '[G]oto [D]efinition' })
    vim.keymap.set('n', 'gr', fzf.lsp_references, { desc = '[G]oto [R]eferences' })
    vim.keymap.set('n', 'gI', fzf.lsp_implementations, { desc = '[G]oto [I]mplementation' })
  end,
}
