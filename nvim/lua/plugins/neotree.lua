return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<c-b>", "<cmd>Neotree toggle<cr>", desc = "Toggle Neotree" },
    { "<c-e>", "<cmd>Neotree focus<cr>", desc = "Focus Neotree" }
  }
}
