require "nvchad.mappings"

local map = vim.keymap.set

map("i", "<M-Left>", "<Home>", { desc = "Beginning of line" })
map("i", "<M-Right>", "<End>", { desc = "End of line" })

map("v", "<M-Left>", "<Home>", { desc = "Beginning of line" })
map("v", "<M-Right>", "<End>", { desc = "End of line" })
map("v", "<M-h>", "<Home>", { desc = "Beginning of line" })
map("v", "<M-l>", "<End>", { desc = "End of line" })
map("v", "<M-Up>", "<Plug>GoVSMUp", { desc = "Move current block up" })
map("v", "<M-Down>", "<Plug>GoVSMDown", { desc = "Move current block down" })

map("n", "<M-Left>", "<Home>", { desc = "Beginning of line" })
map("n", "<M-Right>", "<End>", { desc = "End of line" })
map("n", "<M-h>", "<Home>", { desc = "Beginning of line" })
map("n", "<M-l>", "<End>", { desc = "End of line" })

map("n", "<C-a>", "gg<Home>vG<End>", {})
map("n", "<C-Left>", "<C-w>h", { desc = "Window left" })
map("n", "<C-Right>", "<C-w>l", { desc = "Window right" })
map("n", "<C-Down>", "<C-w>j", { desc = "Window down" })
map("n", "<C-Up>", "<C-w>k", { desc = "Window up" })
map("n", "<M-Up>", "<Plug>GoNSMUp", { desc = "Move current line up" })
map("n", "<M-Down>", "<Plug>GoNSMDown", { desc = "Move current line down" })
map("n", "vv", "viw", { desc = "Select current word" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })

map("n", "<S-k>", function()
  vim.lsp.buf.hover {
    border = "single",
    max_width = math.floor(vim.o.columns * 0.6),
    title_pos = "center",
  }
end, { desc = "LSP Hover" })

map("n", "<leader>dc", function()
  vim.diagnostic.open_float()
end, { desc = "Open diagnostic in floating window" })

map("n", "<leader>kx", function()
  require("nvchad.tabufline").closeAllBufs()
end, { desc = "Close all buffers" })
map("n", "a", "za", { desc = "Fold current buffer" })
map("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {})

map("t", "<C-Left>", vim.api.nvim_replace_termcodes("<C-\\><C-N><C-w>h", true, true, true), { desc = "Window left" })
map("t", "<C-Right>", vim.api.nvim_replace_termcodes("<C-\\><C-N><C-w>l", true, true, true), { desc = "Window right" })
map("t", "<C-Down>", vim.api.nvim_replace_termcodes("<C-\\><C-N><C-w>j", true, true, true), { desc = "Window down" })
map("t", "<C-Up>", vim.api.nvim_replace_termcodes("<C-\\><C-N><C-w>k", true, true, true), { desc = "Window up" })

map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle {
    pos = "float",
    id = "floatTerm",
    float_opts = {
      row = 0.1,
      col = 0.15,
      width = 0.7,
      height = 0.7,
    },
  }
end, { desc = "terminal toggle floating term" })
