return { 
  "nvim-telescope/telescope.nvim",
  tag = "0.1.0",
  dependencies = { 
    { "nvim-lua/plenary.nvim" }
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        file_ignore_patterns = { "node_modules", ".git" }
      }
    })

    telescope.load_extension("yank_history")
  end,
  keys = {
    { "<c-p>", "<cmd>Telescope find_files hidden=true<cr>" },
    { "<c-f>", "<cmd>Telescope live_grep<cr>" },

    -- Plugins
    { "<c-y>", "<cmd>Telescope yank_history<cr>" },
    { "<leader>td", "<cmd>TodoTelescope<cr>" },
  }
}
