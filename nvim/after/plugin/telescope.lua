local m = require "ul.maps"

m.map("n", "<c-p>", "<CMD>Telescope find_files hidden=true<CR>")
m.map("n", "<c-f>", "<CMD>Telescope live_grep<CR>")

-- Plugins
m.map("n", "<c-y>", "<CMD>Telescope yank_history<CR>")
m.map("n", "<leader>todo", "<CMD>TodoTelescope<CR>")

require('telescope').setup {
  defaults = {
    file_ignore_patterns = { "node_modules", ".git" },
  }
}

require('telescope').load_extension("yank_history")
