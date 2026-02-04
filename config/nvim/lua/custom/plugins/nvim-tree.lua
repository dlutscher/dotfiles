return {
  'nvim-tree/nvim-tree.lua',
  event = 'VimEnter',
  config = function()
    require('nvim-tree').setup({
      disable_netrw = true,
      hijack_unnamed_buffer_when_opening = true,
      reload_on_bufenter = true,
      renderer = {
        icons = {
          glyphs = {
            folder = {
              arrow_closed = '', -- arrow when folder is closed
              arrow_open = '', -- arrow when folder is open
            },
          },
        },
      },
      actions = {
        open_file = {
          quit_on_open = false,
          window_picker = {
            enable = true,
          },
        },
      },
      git = {
        ignore = true,
      },
    })
    local function open_nvim_tree(data)
      -- buffer is a directory
      local directory = vim.fn.isdirectory(data.file) == 1

      if not directory then
        return
      end

      -- change to the directory
      vim.cmd.cd(data.file)

      -- open the tree
      require('nvim-tree.api').tree.open()
    end
    vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = open_nvim_tree })
  end,
}