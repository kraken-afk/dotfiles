local nvlsp = require "nvchad.configs.lspconfig"
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
local utils = require "libs.utils"

local lspconfig = require "lspconfig"
local servers = {
  "tailwindcss",
  "biome",
  -- "eslint",
  "emmet_language_server",
  "cssls",
  "intelephense",
  "taplo",
  "lua_ls",
  "dartls",
  "somesass_ls",
  "prismals",
  "glsl_analyzer",
  "astro",
}

-- Emmet HTML
lspconfig.emmet_language_server.setup {
  filetypes = {
    "css",
    "eruby",
    "html",
    "htmldjango",
    "javascriptreact",
    "less",
    "pug",
    "sass",
    "scss",
    "typescriptreact",
    "php",
    "astro",
  },
}

-- Nix
lspconfig.nil_ls.setup {
  cmd = { "nil" },
  filetypes = { "nix" },
  single_file_support = true,
  root_dir = lspconfig.util.root_pattern("flake.nix", ".git"),
  autoArchive = true,
}

-- Typescript
lspconfig.ts_ls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json"),
  single_file_support = false,
  filetypes = {
    "astro",
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
}

-- Deno
lspconfig.denols.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern("deno.json", "import_map.json", "deno.jsonc"),
  single_file_support = false,
}

-- clang
lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  on_init = nvlsp.on_init,
}

-- jsonls
lspconfig.jsonls.setup {
  on_attach = on_attach,
  on_init = nvlsp.on_init,
  capabilities = capabilities,
  filetypes = { "json", "jsonc" },
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
}

-- gopls
require("lspconfig").gopls.setup {
  on_attach = on_attach,
  on_init = nvlsp.on_init,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unreachable = true,
        unusedparams = true,
      },
      codelenses = {
        generate = true,
        gc_details = true,
        test = true,
        tidy = true,
      },
      -- hints = {
      --   assignVariableTypes = true,
      --   constantValues = true,
      --   rangeVariableTypes = true,
      -- }
    },
  },
}

-- Python
require("lspconfig").ruff.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  on_init = nvlsp.on_init,
  init_options = {
    settings = {
      logLevel = "debug",
      inlayHints = true,
    },
  },
}

require("lspconfig").basedpyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  on_init = nvlsp.on_init,
  settings = {
    basedpyright = {
      -- python = {
      -- pythonPath = utils.get_python_path(),
      -- },
      analysis = {
        autoSearchPaths = true, -- LET THIS DO THE WORK
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
        inlayHints = {
          callArgumentNames = false,
          genericTypes = false,
          variableTypes = false,
          functionReturnTypes = false,
        },
      },
    },
  },
}

-- require("lspconfig").pylyzer.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   on_init = nvlsp.on_init,
--   settings = {
--     python = {
--       checkOnType = true,
--       diagnostics = true,
--       inlayHints = true,
--       smartCompletion = true,
--     },
--   },
-- }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
