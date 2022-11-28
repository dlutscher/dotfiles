-- import gitsigns plugin safely
local imported, package = pcall(require, "vim-fugitive")
if not imported then
  print("vim-fugitive not found!")
  return
end

-- configure/enable gitsigns
package.setup()
