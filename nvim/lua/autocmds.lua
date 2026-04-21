require "nvchad.autocmds"

-- Start treesitter for every filetype. The main branch of nvim-treesitter no
-- longer manages highlight modules; pcall handles filetypes without parsers.
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
