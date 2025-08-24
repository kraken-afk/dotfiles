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
        "deno",
        "some-sass-language-server",
        "haskell-language-server",
        "gopls",
        "eslint",
        "prettier",
        "ruff",
        "pylyzer",
        "python-lsp-server",
        "basedpyright",
        "prisma-language-server",
        "glsl_analyzer",
        "astro-language-server",
        "fsautocomplete",
        "fatomas",
        "oxlint",
        "pyrefly",
        "docker-compose-language-service",
        "dockerfile-language-server",
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
    },
  },
  {
    "wakatime/vim-wakatime",
    lazy = true,
    event = { "BufReadPre" },
  },
  { "nvzone/showkeys", cmd = "ShowkeysToggle", opts = { position = "top-center" } },
  {
    "andweeb/presence.nvim",
    lazy = true,
    event = { "BufReadPre" },
    config = function()
      require("presence").setup {
        enable_line_number = true,
        enable_workspace = false,
        workspace_text = "",
        main_image = "file",
        auto_update = true,
        buttons = false,
      }
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
  },
  {
    "dundalek/bloat.nvim",
    cmd = "Bloat",
  },
  {
    "f-person/git-blame.nvim",
    -- load the plugin at startup
    event = "VeryLazy",
    -- Because of the keys part, you will be lazy loading this plugin.
    -- The plugin will only load once one of the keys is used.
    -- If you want to load the plugin at startup, add something like event = "VeryLazy",
    -- or lazy = false. One of both options will work.
    opts = {
      -- your configuration comes here
      -- for example
      enabled = false, -- if you want to enable the plugin
      message_template = " <summary> • <date> • <author>", -- template for the blame message, check the Message template section for more options
      date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
      virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
    },
  },
}
