return {
  "utilyre/barbecue.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "smiteshp/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional
  },
  config = function()
    require("barbecue").setup()
  end,
}
