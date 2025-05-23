return {
  {
    import = "nvchad.blink.lazyspec",
  },
  {

    "saghen/blink.cmp",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      cmdline = { enabled = false },
      keymap = {
        preset = "default",
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<M-l>"] = {
          function(cmp)
            cmp.accept()
          end,
        },
      },
    },
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    enabled = false,
    config = function()
      require("tiny-inline-diagnostic").setup {
        preset = "simple",
        options = {},
      }
    end,
  },
  {
    "chrisgrieser/nvim-lsp-endhints",
    enabled = false,
    event = "LspAttach",
    opts = {}, -- required, even if empty
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Telescope",
    opts = function()
      return require "configs.telescope"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
    opts = {
      inlay_hints = {
        enabled = false,
      },
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
      local M = require "configs.cmp"
      return M
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      local M = require "nvchad.configs.treesitter"
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
        "markdown",
        "dart",
        "scss",
        "haskell",
        "go",
        "gomod",
        "gosum",
        "python",
        "prisma",
        "glsl",
        "astro",
        "nix",
        "fsharp",
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
    "b0o/schemastore.nvim",
  },
  {
    "windwp/nvim-ts-autotag",
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
    ft = {
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "svelte",
      "vue",
      "tsx",
      "jsx",
      "rescript",
      "xml",
      "php",
      "markdown",
      "astro",
      "glimmer",
      "handlebars",
      "hbs",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "folke/todo-comments.nvim",
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "mg979/vim-visual-multi",
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
    init = function()
      vim.g.VM_default_mappings = 0
      vim.g.VM_maps = {
        ["Find Under"] = "<C-d>",
        ["Find Subword Under"] = "<C-d>",
        ["Switch Mode"] = "<Tab>",
        ["Find Next"] = "]",
        ["Find Prev"] = "[",
        ["Goto Next"] = "}",
        ["Goto Prev"] = "{",
        ["Seek Next"] = "<C-f>",
        ["Seek Prev"] = "<C-b>",
        ["Skip Region"] = "q",
        ["Remove Region"] = "Q",
        ["Invert Direction"] = "o",
        ["Find Operator"] = "m",
        ["Surround"] = "S",
        ["Replace Pattern"] = "R",
        ["Select l"] = "<M-C-Right>",
        ["Select h"] = "<M-C-Left>",
      }
    end,
  },

  {
    "booperlv/nvim-gomove",
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("gomove").setup {
        map_defaults = false,
        undojoin = false,
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
  {
    "numToStr/Comment.nvim",
    dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
    keys = {
      { "gcc", mode = "n", desc = "Comment toggle current line" },
      { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
      { "gbc", mode = "n", desc = "Comment toggle current block" },
      { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
      { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
    },
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },
}
