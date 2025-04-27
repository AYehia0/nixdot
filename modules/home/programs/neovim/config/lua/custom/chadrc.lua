---@type ChadrcConfig 
local M = {}
M.ui = {theme = 'github_dark',
    statusline = { theme = "minimal"},
    transparency = true,
    nvdash = {
        load_on_startup = false
    },
    cmp = {
        style = "atom_colored"
    },
    extended_integrations = {
        "rainbowdelimiters",
    }
}
M.plugins = 'custom.plugins'
M.mappings = require('custom.mappings')
return M
