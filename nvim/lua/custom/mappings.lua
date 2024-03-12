--- @type MappingsTable
local mappings = {}

mappings.general = {
  i = {
    ["<M-Left>"] = { "<Home>", "Beginning of line" },
    ["<M-Right>"] = { "<End>", "End of line" },
  },
  v = {
    ["<M-Left>"] = { "<Home>", "Beginning of line" },
    ["<M-Right>"] = { "<End>", "End of line" },
    ["<M-Up>"] = { "<Plug>GoVSMUp", "Move current block ap" },
    ["<M-Down>"] = { "<Plug>GoVSMDown", "Move current block down" },
  },
  n = {
    ["<M-Left>"] = { "<Home>", "Beginning of line" },
    ["<M-Right>"] = { "<End>", "End of line" },
    ["<C-a>"] = { "gg<Home>vG<End>" },
    ["<C-Left>"] = { "<C-w>h", "Window left" },
    ["<C-Right>"] = { "<C-w>l", "Window right" },
    ["<C-Down>"] = { "<C-w>j", "Window down" },
    ["<C-Up>"] = { "<C-w>k", "Window up" },
    ["<M-Up>"] = { "<Plug>GoNSMUp", "Move current line up" },
    ["<M-Down>"] = { "<Plug>GoNSMDown", "Move current line down" },
    ["vv"] = { "viw", "Select current word" },
    ["<leader>kx"] = {
      function()
        require("nvchad.tabufline").closeAllBufs();
      end,
      "Close all buffers",
    },
  },
  t = {
    ["<C-Left>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N><C-w>h", true, true, true), "Window left" },
    ["<C-Right>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N><C-w>l", true, true, true), "Window right" },
    ["<C-Down>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N><C-w>j", true, true, true), "Window down" },
    ["<C-Up>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N><C-w>k", true, true, true), "Window up" },
  }
}

return mappings
