local g = vim.g

g.neoformat_try_node_exe = 1

return {
  "sbdchd/neoformat",
  keys = {
    { "<leader>ft", "<cmd>Neoformat<cr>" }
  },
  config = function()
    vim.cmd [[
      autocmd BufWritePre *.astro,*.md,*.vue,*.js,*.ts,*.json Neoformat
    ]]
  end
}
