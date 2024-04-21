return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "clangd",
        "clang-format",
        "rust-analyzer",
        "typescript-language-server",
        "tailwindcss-language-server",
        "oxlint",
        "biome",
        "json-lsp",
        "emmet-language-server",
        "css-lsp",
        "intelephense",
        "eslint-lsp",
        "taplo",
        "html",
        "deno"
      },
      PATH = "skip",

      ui = {
        icons = {
          package_pending = " ",
          package_installed = "󰄳 ",
          package_uninstalled = " 󰚌",
        },

        keymaps = {
          toggle_server_expand = "<CR>",
          install_server = "i",
          update_server = "u",
          check_server_version = "c",
          update_all_servers = "U",
          check_outdated_servers = "C",
          uninstall_server = "X",
          cancel_installation = "<C-c>",
        },
      },

      max_concurrent_installers = 10,
    }
  },
  {
    'wakatime/vim-wakatime',
    lazy = false
  },
  -- {
  --   'MeanderingProgrammer/markdown.nvim',
  --   ft = { "markdown" },
  --   dependencies = { 'nvim-treesitter/nvim-treesitter' },
  --   config = function()
  --     require('render-markdown').setup({})
  --   end,
  -- },
  {
    "alec-gibson/nvim-tetris",
    enable = true,
    lazy = false,
  },
}
