local nvlsp = require "nvchad.configs.lspconfig"

-- Set global defaults for all servers (Neovim 0.11+)
vim.lsp.config("*", {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
})

-- Servers that need no extra configuration beyond the global defaults
local servers = {
  "biome",
  "emmet_language_server",
  "cssls",
  "intelephense",
  "lua_ls",
  "dartls",
  "somesass_ls",
  "prismals",
  "glsl_analyzer",
  "astro",
  -- "pyrefly",
  "dockerls",
  "docker_compose_language_service",
  "metals",
  "ty",
}

for _, lsp in ipairs(servers) do
  vim.lsp.enable(lsp)
end

-- Emmet — custom filetypes
vim.lsp.config("emmet_language_server", {
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

-- Tailwind CSS — extended filetypes + Rust userLanguages
vim.lsp.config("tailwindcss", {
  filetypes = {
    "html",
    "css",
    "scss",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "astro",
    "vue",
    "svelte",
    "rust",
  },
  init_options = {
    userLanguages = { rust = "html" },
  },
})
vim.lsp.enable "tailwindcss"

-- Nix
vim.lsp.config("nil_ls", {
  cmd = { "nil" },
  filetypes = { "nix" },
  single_file_support = true,
  root_markers = { "flake.nix", ".git" },
  autoArchive = true,
})
vim.lsp.enable "nil_ls"

-- TypeScript — no single-file mode, explicit root markers
vim.lsp.config("ts_ls", {
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

-- ESLint (disabled by default — enable when needed)
vim.lsp.config("eslint", {
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
-- vim.lsp.enable "eslint"

-- Deno (disabled by default — conflicts with ts_ls)
vim.lsp.config("denols", {
  root_markers = { "deno.json", "import_map.json", "deno.jsonc" },
  single_file_support = false,
})
-- vim.lsp.enable "denols"

-- clangd — disable duplicate signatureHelp provider
vim.lsp.config("clangd", {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    nvlsp.on_attach(client, bufnr)
  end,
})
vim.lsp.enable "clangd"

-- JSON with SchemaStore
vim.lsp.config("jsonls", {
  filetypes = { "json", "jsonc" },
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
})
vim.lsp.enable "jsonls"

-- YAML with SchemaStore (disabled by default)
-- vim.lsp.config("yamlls", {
--   settings = {
--     yaml = {
--       schemas = vim.tbl_extend("force", require("schemastore").yaml.schemas(), {
--         ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/refs/heads/master/master-standalone/all.json"] = {
--           "**/*.k8s.yaml",
--           "**/*.k8s.yml",
--         },
--       }),
--       validate = { enable = true },
--     },
--   },
-- })
-- vim.lsp.enable "yamlls"

-- Go
vim.lsp.config("gopls", {
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
  init_options = {
    settings = {
      logLevel = "debug",
      inlayHints = false,
    },
  },
})
vim.lsp.enable "ruff"

vim.lsp.enable "pyrefly"

-- Kotlin
vim.lsp.config("kotlin_language_server", {
  cmd = { "kotlin-language-server" },
  filetypes = { "kotlin" },
  root_markers = { "settings.gradle", "settings.gradle.kts", "build.gradle", "build.gradle.kts" },
})
vim.lsp.enable "kotlin_language_server"

-- Detekt (Kotlin linter)
vim.lsp.config("detekt", {
  cmd = { "detekt-language-server", "--stdio" },
  filetypes = { "kotlin" },
  root_markers = { "detekt.yml", ".detekt.yml", "build.gradle", "build.gradle.kts" },
})
vim.lsp.enable "detekt"

-- Taplo (TOML) with SchemaStore catalog
vim.lsp.config("taplo", {
  settings = {
    evenBetterToml = {
      schema = {
        enabled = true,
        catalogs = { "https://www.schemastore.org/api/json/catalog.json" },
        associations = {},
      },
    },
  },
})
vim.lsp.enable "taplo"

vim.diagnostic.config {
  signs = false,
  underline = true,
  -- virtual_lines = true,
}

vim.lsp.inlay_hint.enable(false)
