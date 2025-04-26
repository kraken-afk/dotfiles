require "nvchad.options"

local opt = vim.opt
local api = vim.api
local wo = vim.wo
local o = vim.o

-- Colors
o.termguicolors = true
api.nvim_set_hl(0, "CurSearch", { bg = "#7aa2f7", fg = "#1a1b26" })

-- Foldable settings
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevelstart = 99

opt.scrolloff = 8

-- Line Wrap
opt.wrap = false
-- Comment in italic
api.nvim_set_hl(0, "Comment", { italic = true })

-- Relative number
wo.relativenumber = true
