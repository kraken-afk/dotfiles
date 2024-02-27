---@type ChadrcConfig
local M = {}

M.ui = { theme = 'tokyonight' }
M.plugins = "custom.plugins"
M.ui.hl_override = require("custom.highlight")

return M
