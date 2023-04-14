return {
  -- LARAVEL
  {
    "adalessa/laravel.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    keys = {
      { "<leader>la", ":Laravel artisan<cr>" },
      { "<leader>lr", ":Laravel routes<cr>" },
      {
        "<leader>lt",
        function()
          require("laravel").app.sendToTinker()
        end,
        mode = "v",
        desc = "Laravel Application Routes",
      },
    },
    event = { "VeryLazy" },
    config = function()
      require("laravel").setup()
      require("telescope").load_extension "laravel"
    end,
  },

  -- ASTRO
  {
    "wuelnerdotexe/vim-astro",
    lazy = false,
    config = function()
      vim.g.astro_typescript = 'enable'
    end
  },
  {
    "virchau13/tree-sitter-astro",
    lazy = false,
    config = function()
      vim.cmd([[ autocmd BufRead,BufEnter *.astro set filetype=astro ]])
    end
  }
}
