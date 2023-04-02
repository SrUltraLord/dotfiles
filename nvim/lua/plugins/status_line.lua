return {
  "b0o/incline.nvim",
  config = function()
    local incline = require("incline")

    incline.setup()
    incline.enable()
  end
}
