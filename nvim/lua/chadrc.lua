-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type
local M = {}

M.ui = require "chadrc_configs.ui"
M.base46 = require "chadrc_configs.theme"
M.nvdash = {
  load_on_startup = true,
}

-- M.ui = require "chadrc_configs.ui"

return M
