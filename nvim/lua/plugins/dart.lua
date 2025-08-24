return {
  "akinsho/flutter-tools.nvim",
  ft = { "dart" },
  enabled = false,
  lazy = true,
  event = { "BufRead" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- optional for vim.ui.select
  },
}
