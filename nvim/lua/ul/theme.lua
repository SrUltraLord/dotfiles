local ok, _ = pcall(vim.cmd, "colorscheme catppuccin-mocha")

-- Makes bg transparent
-- vim.cmd [[
--   autocmd SourcePost * highlight Normal     ctermbg=NONE guibg=NONE
--               \ |    highlight LineNr     ctermbg=NONE guibg=NONE
--               \ |    highlight SignColumn ctermbg=NONE guibg=NONE
-- ]]


vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 120 })
  end,
})
