require "nvchad.options"

local opt       = vim.opt
local g         = vim.g
local api       = vim.api
local wo        = vim.wo
local o         = vim.o

-- Format on save
api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

-- Colors
o.termguicolors = true
api.nvim_set_hl(0, "CurSearch", { bg = "#7aa2f7", fg = "#1a1b26" })

-- Foldable settings
opt.foldmethod        = "expr"
opt.foldexpr          = "nvim_treesitter#foldexpr()"
opt.foldlevelstart    = 99

-- Line Wrap
opt.wrap              = false

-- Vim visual multi
g.VM_default_mappings = 0
g.VM_maps             = {
  ['Find Under'] = '<C-d>',
  ['Find Subword Under'] = '<C-d>',
  ['Switch Mode'] = '<Tab>',
  ['Find Next'] = ']',
  ['Find Prev'] = '[',
  ['Goto Next'] = '}',
  ['Goto Prev'] = '{',
  ['Seek Next'] = '<C-f>',
  ['Seek Prev'] = '<C-b>',
  ['Skip Region'] = 'q',
  ['Remove Region'] = 'Q',
  ['Invert Direction'] = 'o',
  ['Find Operator'] = 'm',
  ['Surround'] = 'S',
  ['Replace Pattern'] = 'R',
  ["Select l"] = "<M-C-Right>",
  ["Select h"] = "<M-C-Left>",
}

-- Comment in italic
api.nvim_set_hl(0, 'Comment', { italic = true })

-- Relative number
wo.relativenumber = true

-- For denols
g.markdown_fenced_languages = {
  "ts=typescript"
}
