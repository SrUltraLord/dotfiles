local m = require "ul.maps"

local g = vim.g
local opt = vim.opt

-- disable netrw at the very start of your init.lua (strongly advised)
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
opt.termguicolors = true

m.map("n", "<c-b>", "<CMD>Neotree toggle<CR>")
m.map("n", "<c-E>", "<CMD>Neotree focus<CR>")

-- OR setup with some options
require("neo-tree").setup({
})
