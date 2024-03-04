local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities
local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

lspconfig.clangd.setup({
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities
})

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "rust" },
  root_dir = util.root_pattern("Cargo.toml"),
  settings = {
    ['rust_analyzer'] = {
      cargo = {
        allFeatures = true,
      },
      diagnostics = {
        enable = true,
      }
    }
  }
})

lspconfig.eslint.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "oxlint" }
})

local servers = { "tsserver", "tailwindcss", "biome", "jsonls", "emmet_language_server", "cssls", "intelephense" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities
  })
end
