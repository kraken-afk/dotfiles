return {
  {
    import = "nvchad.blink.lazyspec",
  },
  {

    "saghen/blink.cmp",
    dependencies = {
      -- {
      --   "supermaven-inc/supermaven-nvim",
      --   opts = {
      --     disable_inline_completion = true, -- disables inline completion for use with cmp
      --     disable_keymaps = true, -- disables built in keymaps for more manual control
      --     log_level = "off",
      --   },
      -- },
      -- {
      --   "huijiro/blink-cmp-supermaven",
      -- },
    },
    enabled = function()
      return not vim.tbl_contains({
        "NvimTree",
        "Telescope",
        "TelescopePrompt",
      }, vim.bo.filetype) and vim.bo.buftype ~= "prompt" and vim.b.completion ~= false
    end,
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      completion = {
        menu = { auto_show = true },
        ghost_text = {
          show_with_menu = true,
          enabled = true,
        },
      }, -- end completion
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        providers = {
          -- supermaven = {
          --   name = "supermaven",
          --   module = "blink-cmp-supermaven",
          --   async = true,
          -- },
        },
      },
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
        ["<M-;>"] = {
          function(cmp)
            cmp.cancel()
          end,
        },
      },
    },
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
    opts = {},
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
        "dockerfile",
        "cpp",
        "commonlisp",
        "scala",
        "kotlin",
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
    "jake-stewart/multicursor.nvim",
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
    branch = "1.0",
    config = function()
      local mc = require "multicursor-nvim"
      mc.setup()

      local set = vim.keymap.set

      -- Add or skip adding a new cursor by matching word/selection
      set({ "n", "x" }, "<leader>n", function()
        mc.matchAddCursor(1)
      end, { desc = "Add a new cursor to a match selection" })

      set({ "n", "x" }, "<leader>s", function()
        mc.matchSkipCursor(1)
      end, { desc = "Skip and move to the next match" })

      set({ "n", "x" }, "<leader>N", function()
        mc.matchAddCursor(-1)
      end, { desc = "Add a new cursor to a match going backward" })

      set({ "n", "x" }, "<leader>S", function()
        mc.matchSkipCursor(-1)
      end, { desc = "Skip and move to the previous match" })

      -- Add and remove cursors with control + left click.
      set("n", "<c-leftmouse>", mc.handleMouse, { desc = "Add/remove cursor at mouse position" })
      set("n", "<c-leftdrag>", mc.handleMouseDrag, { desc = "Add cursors while dragging mouse" })
      set("n", "<c-leftrelease>", mc.handleMouseRelease, { desc = "Finish adding cursors with mouse" })

      -- Disable and enable cursors.
      set({ "n", "x" }, "<c-q>", mc.toggleCursor, { desc = "Toggle cursor at current position" })

      -- Mappings defined in a keymap layer only apply when there are
      -- multiple cursors. This lets you have overlapping mappings.
      mc.addKeymapLayer(function(layerSet)
        -- Select a different cursor as the main one.
        layerSet({ "n", "x" }, "<left>", mc.prevCursor)
        layerSet({ "n", "x" }, "<right>", mc.nextCursor)

        -- Delete the main cursor.
        layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)

        -- Enable and clear cursors using escape.
        layerSet("n", "<esc>", function()
          if not mc.cursorsEnabled() then
            mc.enableCursors()
          else
            mc.clearCursors()
          end
        end)
      end)

      -- Customize how cursors look.
      local hl = vim.api.nvim_set_hl
      hl(0, "MultiCursorCursor", { reverse = true })
      hl(0, "MultiCursorVisual", { link = "Visual" })
      hl(0, "MultiCursorSign", { link = "SignColumn" })
      hl(0, "MultiCursorMatchPreview", { link = "Search" })
      hl(0, "MultiCursorDisabledCursor", { reverse = true })
      hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
      hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
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
