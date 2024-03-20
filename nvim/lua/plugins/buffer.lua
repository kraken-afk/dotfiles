return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require("configs.lspconfig")
    end,
    opts = {
      inlay_hints = {
        enabled = true
      }
    },
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("luasnip").config.set_config(opts)
          require "nvchad.configs.luasnip"
        end,
      },
    },
    opts = function()
      local M = require("configs.cmp")
      return M
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require("configs.null-ls")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      local M = require("nvchad.configs.treesitter")
      M.ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
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

      return M
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "syntax")
      dofile(vim.g.base46_cache .. "treesitter")
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    "b0o/schemastore.nvim"
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx',
      'rescript',
      'xml',
      'php',
      'markdown',
      'astro', 'glimmer', 'handlebars', 'hbs'
    },
    config = function()
      require('nvim-ts-autotag').setup()
    end
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  {
    "mg979/vim-visual-multi",
    lazy = false
  },
  {
    "lvimuser/lsp-inlayhints.nvim",
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
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      return require "configs.nvimtree"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "nvimtree")
      require("nvim-tree").setup(opts)
    end,
  },
}

