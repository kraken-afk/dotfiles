local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    -- css = { "prettier" },
    -- html = { "prettier" },
    javascript = { "biome" },
    typescript = { "biome" },
    json = { "biome" },
    -- rust = { "cargo fmt" }
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 300,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
