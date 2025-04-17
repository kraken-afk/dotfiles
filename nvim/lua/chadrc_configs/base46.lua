local M = {}

M.hl_override = {
  NvimTreeFolderIcon = { fg = "vibrant_green" },
  NvimTreeFolderArrowOpen = { fg = "white" },
  NvimTreeFolderName = { fg = "blue" },
  TelescopePromptTitle = {
    fg = "white",
    bg = "NONE",
  },
  TelescopePreviewTitle = {
    fg = "red",
    bg = "NONE",
  },

  TelescopePromptPrefix = {
    fg = "vibrant_red",
    bg = "NONE",
  },
  TelescopeResultsTitle = {
    fg = "red",
    bg = "NONE",
  },
  DiagnosticWarn = {
    fg = "yellow",
    bg = { "yellow", "black", 90 },
  },
  DiagnosticError = {
    fg = "red",
    bg = { "red", "black", 90 },
  },
  DiagnosticHint = {
    fg = "purple",
    bg = { "red", "black", 90 },
  },
}

M.transparency = true
M.theme = "tokyonight"

M.telescope = { style = "bordered" }

return M
