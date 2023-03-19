local m = require "ul.maps"

m.map("n", "<c-y>", "<CMD>Telescope yank_history<CR>")

require("yanky").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
})
