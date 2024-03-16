local plugins = {
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
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end,
    opts = {
      inlay_hints = {
        enabled = true
      }
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require("custom.configs.null-ls")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "tsx",
        "javascript",
        "typescript",
        "html",
        "css",
        "rust",
        "c",
        "json",
        "jsonc",
        "cmake",
        "toml",
        "yaml",
        "php",
      }
    }
  },
  {
    'wakatime/vim-wakatime',
    lazy = false
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    'saecki/crates.nvim',
    ft = { 'rust, toml' },
    config = function(_, opts)
      local crates = require("crates")
      crates.setup(opts)
      crates.show()
    end
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require("plugins.configs.cmp")
      table.insert(M.sources, { name = "crates" })
      return M
    end
  },
  {
    "lvimuser/lsp-inlayhints.nvim",
  },
  {
    'simrat39/rust-tools.nvim',
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require("custom.configs.rust-tools")
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
  {
    "booperlv/nvim-gomove",
    lazy = false,
    config = function()
      require("gomove").setup {
        map_defaults = false,
        undojoin = false
      }
    end,
  },
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
  {
    "windwp/nvim-ts-autotag",
    ft = {
      'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript',
      'xml',
      'php',
      'markdown',
      'astro', 'glimmer', 'handlebars', 'hbs'
    },
    config = function()
      require('nvim-ts-autotag').setup()
    end
  },
}

return plugins
