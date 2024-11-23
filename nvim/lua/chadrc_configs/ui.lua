---@class UIConfig
local M = {}

M.tabufline = {
  enabled = true,
  lazyload = true,
  order = { "buffers", "tabs" },
  modules = nil,
}

M.statusline = {
  theme = "minimal",
  separator_style = "block",
  order = { "%=", "lsp_msg", "%=", "diagnostics", "mode", "cursor" },
}

M.format_colors = {
  tailwind = true,
}

return M
