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
      },
      mappings = {
        n = {
          ['<c-d>'] = require('telescope.actions').delete_buffer
        }
      }
    })

    telescope.load_extension("yank_history")
  end,
  keys = {
    { "<c-p>",      "<cmd>Telescope find_files hidden=false<cr>" },
    { "<leader>pp", "<cmd>Telescope commands<cr>" },
    { "<c-f>",      "<cmd>Telescope live_grep<cr>" },
    { "<leader>b",  "<cmd>Telescope buffers initial_mode=normal<cr>", mode = { 'n', 'v' } },

    -- Plugins
    { "<c-y>",      "<cmd>Telescope yank_history<cr>" },
    { "<leader>td", "<cmd>TodoTelescope<cr>" },
  }
}
