require "nvchad.options"

local opt             = vim.opt
local g               = vim.g
local api = vim.api

-- Foldable settings
opt.foldmethod        = "expr"
opt.foldexpr          = "nvim_treesitter#foldexpr()"
opt.foldlevelstart    = 99

-- Line Wrap
opt.wrap = false


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
  ['Replace Pattern'] = 'R'
}

-- Comment in italic
api.nvim_set_hl(0, 'Comment', { italic=true })
