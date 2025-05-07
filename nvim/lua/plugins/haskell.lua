return {
  "mrcjkb/haskell-tools.nvim",
  lazy = true,
  event = { "BufReadPost", "BufNewFile" },
  version = "^3", -- Recommended
  ft = { "haskell", "lhaskell", "cabal", "yaml", "ghci" },
}
