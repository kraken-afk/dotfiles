local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "biome", "biome-organize-imports" },
    javascriptreact = { "biome", "biome-organize-imports" },
    typescript = { "biome", "biome-organize-imports" },
    typescriptreact = { "biome", "biome-organize-imports" },
    astro = { "biome", "biome-organize-imports" },
    json = { "biome", "biome-organize-imports" },
    go = { "gofmt" },
    css = { "biome" },
    html = { "biome" },
    rust = { "dx_fmt" },
    scala = { "scalafmt --stdin" },
    -- kotlin = { "ktfmt" },
  },
  format_on_save = {
    timeout_ms = 300,
    lsp_fallback = true,
  },
  formatters = {
    dx_fmt = {
      command = "dx",
      args = { "fmt", "--file", "$FILENAME", "--all-code" },
      stdin = false,
    },
    biome = {
      requier_cwd = true,
    },
  },
}

return options
