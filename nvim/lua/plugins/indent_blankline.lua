return { 
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    require("indent_blankline").setup({
      space_char_blankline = " ",
      show_current_context = true,
      indent = 1,
    })
  end
}
