return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    require("bufferline").setup()
  end,
  keys = {
    { "<c-x>", "<cmd>bd<cr>" },
    { "<c-g>", "<cmd>BufferLinePick<cr>" },
    { "gt", "<cmd>BufferLineCycleNext<cr>" },
    { "gT", "<cmd>BufferLineCyclePrev<cr>" },

    { "<leader>tcr", "<cmd>BufferLineCloseRight<cr>" },
    { "<leader>tca", "<cmd>BufferLineGroupClose ungrouped<cr>" },
    { "<leader>ts", "<cmd>BufferLinePick<cr>" }
  }
}
