dofile(vim.g.base46_cache .. "cmp")

local cmp = require "cmp"
local types = require "cmp.types"

local options = {
  completion = { completeopt = "menu,menuone" },

  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  sorting = {

    comparators = {
      -- Custom comparator with highest priority for fields, local variables, and functions
      function(entry1, entry2)
        local kind1 = entry1:get_kind()
        local kind2 = entry2:get_kind()

        local orderMap = {
          [types.lsp.CompletionItemKind.Field] = 1, -- Highest priority
          [types.lsp.CompletionItemKind.Variable] = 1,
          [types.lsp.CompletionItemKind.Function] = 1,
          [types.lsp.CompletionItemKind.Module] = 2,
          [types.lsp.CompletionItemKind.Class] = 2,
          [types.lsp.CompletionItemKind.Snippet] = 3, -- Lowest priority
        }

        local val1 = orderMap[kind1] or 3
        local val2 = orderMap[kind2] or 3

        if val1 ~= val2 then
          return val1 < val2
        end
      end,

      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.locality,
      cmp.config.compare.kind,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },

  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),

    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("luasnip").expand_or_jumpable() then
        require("luasnip").expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("luasnip").jumpable(-1) then
        require("luasnip").jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },

  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
}

return vim.tbl_deep_extend("force", options, require "nvchad.cmp")
