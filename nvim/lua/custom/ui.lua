--- @type UIConfig
local ui = {}

ui.hl_override = {
  NvDashAscii = { bg = "NONE", fg = "cyan" },
  NvDashButtons = { bg = "NONE", fg = "teal" }
}

ui.statusline = {
  separator_style = "round",
}

ui.theme = "tokyonight"

ui.telescope = { style = "bordered" }

ui.nvdash = {
  load_on_startup = true,
  header = {
    [[                                                ]],
    [[                                          _.oo. ]],
    [[                  _.u[[/;:,.         .odMMMMMM' ]],
    [[               .o888UU[[[/;:-.  .o@P^    MMM^   ]],
    [[              oN88888UU[[[/;::-.        dP^     ]],
    [[             dNMMNN888UU[[[/;:--.   .o@P^       ]],
    [[            ,MMMMMMN888UU[[/;::-. o@^           ]],
    [[            NNMMMNN888UU[[[/~.o@P^              ]],
    [[            888888888UU[[[/o@^-..               ]],
    [[           oI8888UU[[[/o@P^:--..                ]],
    [[        .@^  YUU[[[/o@^;::---..                 ]],
    [[      oMP     ^/o@P^;:::---..                   ]],
    [[   .dMMM    .o@^ ^;::---...                     ]],
    [[  dMMMMMMM@^`       `^^^^                       ]],
    [[ YMMMUP^                                        ]],
    [[  ^^                                            ]],
    [[                                                ]],
  },
  buttons = {
    { "  Find File", "Spc f f", "Telescope find_files" },
    { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
    { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
    { "  Bookmarks", "Spc m a", "Telescope marks" },
  }
}

return ui
