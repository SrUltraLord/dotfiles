vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 120 })
  end,
})


require("catppuccin").setup {
  highlight_overrides = {
    all = function(colors)
      return {
        NvimTreeNormal = { fg = colors.none },
        CmpBorder = { fg = "#3e4145" },
      }
    end,
    mocha = function(mocha)
      return {
        Comment = { fg = mocha.surface2 },
      }
    end,
  },
  indent_blankline = {
    enabled = true,
    colored_indent_levels = false,
  },
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    telescope = true,
  },
  native_lsp = {
    enabled = true,
    virtual_text = {
      errors = { "italic" },
      hints = { "italic" },
      warnings = { "italic" },
      information = { "italic" },
    },
    underlines = {
      errors = { "underline" },
      hints = { "underline" },
      warnings = { "underline" },
      information = { "underline" },
    },
  },
}

-- vim.cmd "colorscheme catppuccin-mocha"
vim.cmd "colorscheme tokyonight-moon"
