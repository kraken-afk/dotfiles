return {
  {
    "MunifTanjim/nui.nvim"
  },
  {
    'stevearc/dressing.nvim',
    lazy = false,
    opts = {},
    config = function()
      require("dressing").setup()
    end
  },
}

