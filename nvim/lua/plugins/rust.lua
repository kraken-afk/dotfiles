return {
  {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    event = { "BufRead Cargo.toml" },
    config = function()
      require("crates").setup {}
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
    ft = { "rust", "toml" },
    version = "^5", -- Recommended
    init = function()
      vim.g.rustaceanvim = require "configs.rust-tools"
    end,
  },
}
