-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

-- configure treesitter
treesitter.setup({
  -- enable syntax highlighting
  highlight = {
    enable = true,
  },
  -- ensure these language parsers are installed
  ensure_installed = {
    "bash",
    "c",
    "dockerfile",
    "gitignore",
    "go",
    "java",
    "json",
    "latex",
    "markdown",
    "nix",
    "python",
    "rust",
  },
  -- auto install above language parsers
  auto_install = true,
})
