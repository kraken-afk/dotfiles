local nvlsp = require "nvchad.configs.lspconfig"
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local servers = {
  "eslint",
  "tailwindcss",
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
vim.lsp.config("emmet_language_server.setup", {
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
})
vim.lsp.enable "emmet_language_server"

-- Nix
vim.lsp.config("nil_ls", {
  cmd = { "nil" },
  filetypes = { "nix" },
  single_file_support = true,
  root_markers = { "flake.nix", ".git" },
  autoArchive = true,
})
vim.lsp.enable "nil_ls"

-- Typescript
vim.lsp.config("ts_ls", {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  root_markers = { "package.json", "tsconfig.json" },
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
})

vim.lsp.enable "ts_ls"

vim.lsp.config("eslint", {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = { "vscode-eslint-language-server", "--stdio" },
  root_markers = {
    ".eslintrc",
    ".eslintrc.js",
    ".eslintrc.cjs",
    ".eslintrc.yaml",
    ".eslintrc.yml",
    ".eslintrc.json",
    "eslint.config.js",
    "eslint.config.mjs",
    "eslint.config.cjs",
    "eslint.config.ts",
    "eslint.config.mts",
    "eslint.config.cts",
  },
})
vim.lsp.enable "eslint"

-- Deno
vim.lsp.config("denols", {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  root_markers = { "deno.json", "import_map.json", "deno.jsonc" },
  single_file_support = false,
})
-- vim.lsp.enable "denols"

-- clang
vim.lsp.config("clangd", {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  on_init = nvlsp.on_init,
})
vim.lsp.enable "clangd"

-- jsonls
vim.lsp.config("jsonls", {
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
})
vim.lsp.enable "jsonls"

-- gopls
vim.lsp.config("gopls", {
  on_attach = on_attach,
  on_init = nvlsp.on_init,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = { "go.work", "go.mod", ".git" },
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
    },
  },
})
vim.lsp.enable "gopls"

-- Python
vim.lsp.config("ruff", {
  on_attach = on_attach,
  capabilities = capabilities,
  on_init = nvlsp.on_init,
  init_options = {
    settings = {
      logLevel = "debug",
      inlayHints = true,
    },
  },
})
vim.lsp.enable "ruff"

vim.lsp.config("basedpyright", {
  on_attach = on_attach,
  capabilities = capabilities,
  on_init = nvlsp.on_init,
  settings = {
    basedpyright = {
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
})
vim.lsp.enable "basedpyright"

-- vim.lsp.config("pylyzer", {
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
-- })
-- vim.lsp.enable('pylyzer')

-- lsps with default config
for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
  vim.lsp.enable(lsp)
end

vim.diagnostic.config {
  signs = false,
  underline = true,
  virtual_lines = true,
}
