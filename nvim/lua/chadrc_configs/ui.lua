---@class UIConfig
local M = {}

-- M.nvdash = {
--   load_on_startup = true,
--   header = {
--     [[                                                                       ]],
--     [[                                                                     ]],
--     [[       ████ ██████           █████      ██                     ]],
--     [[      ███████████             █████                             ]],
--     [[      █████████ ███████████████████ ███   ███████████   ]],
--     [[     █████████  ███    █████████████ █████ ██████████████   ]],
--     [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
--     [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
--     [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
--     [[                                                                       ]],
--   },
--   buttons = {
--     --   { "  Find File", "Spc f f", "Telescope find_files" },
--     --   { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
--     --   { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
--     --   { "  Bookmarks", "Spc m a", "Telescope marks" },
--   },
-- }

M.statusline = {
  -- theme = "minimal",
  -- separator_style = "block",
}

M.tabufline = {
  enabled = true,
  lazyload = true,
  order = { "buffers", "tabs" },
  modules = nil,
}

return M
