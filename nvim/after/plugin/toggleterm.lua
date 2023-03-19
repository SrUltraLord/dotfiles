local m = require "ul.maps"

m.map("n", "<c-t>", "<CMD>ToggleTerm size=10 direction=horizontal<CR>")

require("toggleterm").setup {}
