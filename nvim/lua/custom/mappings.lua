--- @type MappingsTable
local mappings = {}

mappings.general = {
  i = {
    -- go to  beginning and end
    ["<M-Left>"] = { "<Home>", "Beginning of line" },
    ["<M-Right>"] = { "<End>", "End of line" },
  },
  v = {
    -- go to  beginning and end
    ["<M-Left>"] = { "<Home>", "Beginning of line" },
    ["<M-Right>"] = { "<End>", "End of line" },
  },
  n = {
    -- go to  beginning and end
    ["<M-Left>"] = { "<Home>", "Beginning of line" },
    ["<M-Right>"] = { "<End>", "End of line" },
    ["<C-a>"] = {"gg<Home>vG<End>"},
    ["<C-Left>"] = { "<C-w>h", "Window left" },
    ["<C-Right>"] = { "<C-w>l", "Window right" },
    ["<C-Down>"] = { "<C-w>j", "Window down" },
    ["<C-Up>"] = { "<C-w>k", "Window up" },
  }
}

return mappings
