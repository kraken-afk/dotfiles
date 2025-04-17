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
    version = "^5", -- Recommended
    init = function()
      vim.g.rustaceanvim = require "configs.rust-tools"
    end,
    ft = { "rust", "toml" },
  },
}
