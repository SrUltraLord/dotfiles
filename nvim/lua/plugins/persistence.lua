-- This plugin handles session persistence
return {
  "folke/persistence.nvim",
  event = "VimEnter",
  module = "persistence",
  config = function()
    require("persistence").setup()
  end, 
}
