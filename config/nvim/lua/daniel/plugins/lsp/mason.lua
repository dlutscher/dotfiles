-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
  print("mason not found!")
  return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  print("mason-lspconfig not found!")
  return
end

-- enable mason
mason.setup()

mason_lspconfig.setup({
  -- list of servers for mason to install
  ensure_installed = {
    "bashls", -- bash
    "pyright", -- python
    "rust_analyzer", -- rust
    "clangd", -- C and C++
    "cmake", -- cmake
    "dockerls", -- docker
    -- "gopls", -- Go
    "graphql", -- GraphQL
    "jsonls", -- JSON
    "jdtls", -- Java
    -- "jsonnet_ls", -- JSONnet
    "marksman", -- Markdown
    "rnix", -- nix
    -- "sqls", -- SQL
    "taplo", -- TOML
    -- "terraform-ls", -- terraform
    "yamlls", -- YAML


    "tsserver", -- typescript
    "html", -- html
    "cssls", -- css
    "sumneko_lua", -- lua

    "ltex", -- latex
  },
  -- auto-install configured servers (with lspconfig)
  automatic_installation = true, -- not the same as ensure_installed
})
