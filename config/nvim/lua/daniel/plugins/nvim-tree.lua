local installed, tree = pcall(require, "nvim-tree")
if not installed then
  return
end

-- recommeded settings from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

tree.setup({
  -- change folder arrow icons
  renderer = {
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "", -- arrow when folder is closed
          arrow_open = "", -- arrow when folder is open
        },
      },
    },
  },
  create_in_closed_folder = true,
  -- disable window_picker for
  -- explorer to work well with
  -- window splits
  actions = {
    open_file = {
      quit_on_open = true,
      window_picker = {
        enable = false,
      },
    },
  },
-- 	git = {
-- 		ignore = false,
-- 	},
})
