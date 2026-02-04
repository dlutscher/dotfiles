return {
  'rmehri01/onenord.nvim',
  priority = 1000,
  init = function()
    vim.cmd.colorscheme 'onenord'
    vim.cmd.hi 'Comment gui=none'
  end,
}