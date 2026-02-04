return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    -- Test adapters
    'nvim-neotest/neotest-python',
    -- Add more adapters as needed:
    -- 'nvim-neotest/neotest-jest',
    -- 'nvim-neotest/neotest-go',
    -- 'marilari88/neotest-vitest',
  },
  config = function()
    require('neotest').setup({
      adapters = {
        require('neotest-python')({
          dap = { justMyCode = false },
          args = { '--log-level', 'DEBUG' },
          runner = 'pytest',
        }),
        -- Add more adapter configurations here
      },
      status = {
        enabled = true,
        virtual_text = true,
        signs = true,
      },
      output = {
        enabled = true,
        open_on_run = true,
      },
      quickfix = {
        enabled = true,
        open = false,
      },
      floating = {
        border = 'rounded',
        max_height = 0.8,
        max_width = 0.9,
      },
    })

    -- Keymaps
    local neotest = require('neotest')

    -- Run the nearest test
    vim.keymap.set('n', '<leader>tt', function()
      neotest.run.run()
    end, { desc = '[T]est: Run nearest [t]est' })

    -- Run the current file
    vim.keymap.set('n', '<leader>tf', function()
      neotest.run.run(vim.fn.expand('%'))
    end, { desc = '[T]est: Run current [f]ile' })

    -- Run all tests
    vim.keymap.set('n', '<leader>ta', function()
      neotest.run.run(vim.fn.getcwd())
    end, { desc = '[T]est: Run [a]ll tests' })

    -- Toggle test summary
    vim.keymap.set('n', '<leader>ts', function()
      neotest.summary.toggle()
    end, { desc = '[T]est: Toggle [s]ummary' })

    -- Show test output
    vim.keymap.set('n', '<leader>to', function()
      neotest.output.open({ enter = true })
    end, { desc = '[T]est: Show [o]utput' })

    -- Toggle output panel
    vim.keymap.set('n', '<leader>tO', function()
      neotest.output_panel.toggle()
    end, { desc = '[T]est: Toggle [O]utput panel' })

    -- Stop the nearest test
    vim.keymap.set('n', '<leader>tS', function()
      neotest.run.stop()
    end, { desc = '[T]est: [S]top nearest test' })

    -- Debug the nearest test (requires nvim-dap)
    vim.keymap.set('n', '<leader>td', function()
      neotest.run.run({ strategy = 'dap' })
    end, { desc = '[T]est: [D]ebug nearest test' })

    -- Jump to next failed test
    vim.keymap.set('n', ']t', function()
      neotest.jump.next({ status = 'failed' })
    end, { desc = 'Jump to next failed test' })

    -- Jump to previous failed test
    vim.keymap.set('n', '[t', function()
      neotest.jump.prev({ status = 'failed' })
    end, { desc = 'Jump to previous failed test' })
  end,
}
