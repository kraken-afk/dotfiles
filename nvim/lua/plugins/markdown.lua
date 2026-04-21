return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      enabled = true,
      heading = { disable_background = true },
      code = { highlight_border = false, disable_background = true },
      completions = { blink = { enabled = true } },
      -- nvim 0.12 changed virtual text / extmark hl_mode defaults
      render_modes = { "n", "c", "t" },
    },
  },
}
