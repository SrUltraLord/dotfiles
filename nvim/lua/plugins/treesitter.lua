return {
  -- Base
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          "javascript",
          "rust",
          "typescript",
          "lua",
          "vue"
        },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
    end
  },

  -- Astro
  {
    "virchau13/tree-sitter-astro",
    config = function()
      vim.cmd([[ autocmd BufRead,BufEnter *.astro set filetype=astro ]])

      vim.filetype.add({
        extension = {
          astro = "astro"
        }
      })
    end
  }
}
