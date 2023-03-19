local m = require "ul.maps"

m.map("n", "<c-p>", "<CMD>Telescope find_files<CR>")
m.map("n", "<leader>ff", "<CMD>Telescope find_files hidden=true<CR>")
m.map("n", "<c-f>", "<CMD>Telescope live_grep<CR>")
m.map("n", "<leader>fp", "<CMD>Telescope live_grep<CR>")

require('telescope').setup {
  defaults = {
    file_ignore_patterns = { "node_modules", ".git" },
  }
}

require('telescope').load_extension("yank_history")
