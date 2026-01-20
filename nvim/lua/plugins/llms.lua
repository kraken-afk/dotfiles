return {

  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    enabled = false,
    init = function()
      vim.g.root_spec = { { ".git" }, "lsp", "cwd" }
    end,
    opts = {
      -- add any opts here
      behavior = {
        use_cwd_as_project_root = true,
      },
      provider = "copilot",
      providers = {
        copilot = {
          model = "gpt-5",
          endpoint = "https://api.githubcopilot.com",
          proxy = nil, -- [protocol://]host[:port] Use this proxy
          allow_insecure = false, -- Allow insecure server connections
          timeout = 30000, -- Timeout in milliseconds
          extra_request_body = {
            mode = "immersive",
          },
        },
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "ibhagwan/fzf-lua",
      "zbirenbaum/copilot.lua", -- for providers='copilot'
    },
  },
  {
    "zbirenbaum/copilot.lua",
    enabled = false,
    cmd = "Copilot",
    lazy = true,
    event = "InsertEnter",
    opts = {
      filetypes = {
        markdown = true,
        help = true,
        suggestion = { enabled = false },
        panel = { enabled = false },
      },
    },
  },
  -- {
  --   "supermaven-inc/supermaven-nvim",
  --   lazy = true,
  --   event = "InsertEnter",
  --   opts = {
  --     keymaps = {
  --       accept_suggestion = "<M-l>",
  --       clear_suggestion = "<M-;>",
  --       accept_word = "<M-j>",
  --     },
  --   },
  --   -- config = function()
  --   --   require("supermaven-nvim").setup {}
  --   -- end,
  -- },
  {
    "NickvanDyke/opencode.nvim",
    dependencies = {
      -- Recommended for `ask()` and `select()`.
      -- Required for `snacks` provider.
      ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
      { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
    },
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition" on the type or field.
      }

      -- Required for `opts.events.reload`.
      vim.o.autoread = true
    end,
  },
}
