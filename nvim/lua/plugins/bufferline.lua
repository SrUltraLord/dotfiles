return {
  "akinsho/bufferline.nvim",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    require("bufferline").setup()
  end,
  keys = {
    { "<c-x>", "<cmd>bd<cr>" },
    { "gt", "<cmd>BufferLineCycleNext<cr>" },
    { "gT", "<cmd>BufferLineCyclePrev<cr>" },

    { "<leader>g", "<cmd>BufferLinePick<cr>" },
    { "<leader>tcr", "<cmd>BufferLineCloseRight<cr>" },
    { "<leader>tca", "<cmd>BufferLineGroupClose ungrouped<cr>" },
    { "<leader>ts", "<cmd>BufferLinePick<cr>" }
  }
}
