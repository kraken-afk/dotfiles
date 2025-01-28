local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    -- javascript = { "biome" },
    -- javascript = { "biome" },
    typescript = { "prettier" },
    javascript = { "prettier" },
    astro = { "biome" },
    json = { "biome" },
    go = { "gofmt" },
    css = { "prettier" },
    html = { "prettier" },
    rust = { "cargo fmt" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 300,
    lsp_fallback = true,
  },
}

return options
