---@class UIConfig
local M = {}

M.hl_override = {
  NvDashAscii = { bg = "NONE", fg = "purple" },
  NvDashButtons = { bg = "NONE", fg = "teal" },
  NvimTreeFolderIcon = { fg = "vibrant_green" },
  NvimTreeFolderArrowOpen = { fg = "white" },
  NvimTreeFolderName = { fg = "blue" },
  NvimTreeOpenedFolderName = { fg = "baby_pink" },
}

M.statusline = {
  theme = "minimal",
  separator_style = "round",
}

M.transparency = true
M.theme = "tokyonight"

M.telescope = { style = "bordered" }

M.nvdash = {
  load_on_startup = true,
  header = {
    [[                                                                       ]],
    [[                                                                     ]],
    [[       ████ ██████           █████      ██                     ]],
    [[      ███████████             █████                             ]],
    [[      █████████ ███████████████████ ███   ███████████   ]],
    [[     █████████  ███    █████████████ █████ ██████████████   ]],
    [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
    [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
    [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
    [[                                                                       ]],
  },
  buttons = {
    --   { "  Find File", "Spc f f", "Telescope find_files" },
    --   { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
    --   { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
    --   { "  Bookmarks", "Spc m a", "Telescope marks" },
  }
}

M.tabufline = {
  enabled = true,
  lazyload = true,
  order = { "buffers", "tabs" },
  modules = nil
}

M.term = {
  float = {
    row = 0.1,
    col = 0.15,
    width = 0.65,
    height = 0.7,
  },
}

return M
