return {
  "ray-x/go.nvim",
  lazy = true,
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("go").setup()
  end,
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
