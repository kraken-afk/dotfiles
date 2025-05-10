local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "biome" },
    typescript = { "biome" },
    astro = { "biome" },
    json = { "biome" },
    go = { "gofmt" },
    css = { "biome" },
    html = { "biome" },
    rust = { "cargo fmt" },
  },

  format_on_save = {
    timeout_ms = 300,
    lsp_fallback = true,
  },
}

return options
