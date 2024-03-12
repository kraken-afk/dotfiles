--- @type UIConfig
local ui = {}

ui.hl_override = {
  NvDashAscii = { bg = "NONE", fg = "cyan" },
  NvDashButtons = { bg = "NONE", fg = "teal" },
  NvimTreeFolderIcon = { fg = "vibrant_green" },
  NvimTreeFolderArrowOpen = { fg = "white" },
  NvimTreeFolderName = { fg = "white" },
  NvimTreeOpenedFolderName = { fg = "baby_pink" },
}

ui.statusline = {
  theme = "minimal"
}

ui.theme = "tokyonight"

ui.telescope = { style = "bordered" }

ui.nvdash = {
  load_on_startup = true,
  header = {
    " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
    " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
    " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
    " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
    " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
    " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",

  },
  buttons = {
    -- { "  Find File", "Spc f f", "Telescope find_files" },
    -- { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
    -- { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
    -- { "  Bookmarks", "Spc m a", "Telescope marks" },
  }
}

ui.tabufline = {
  overriden_modules = function(modules)
    table.insert(modules, modules[1])
    table.remove(modules, 1)
  end,
}

return ui
