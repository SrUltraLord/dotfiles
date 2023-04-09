-- config for the astro web framework
return {
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
