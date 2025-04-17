return {
  "ray-x/go.nvim",
  event = "VeryLazy",
  config = function()
    require("go").setup()
  end,
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
