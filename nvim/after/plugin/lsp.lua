local lspconfig = require('lspconfig')
local lspzero = require('lsp-zero')

lspzero.ensure_installed({
  'html',
  'eslint',
  'tsserver',
  'volar',
  'rust_analyzer'
})

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
      prefix = '',
      spacing = 2,
    },
    signs = true,
    underline = true,
  }
)

-- Configurar los colores de los diagnósticos
vim.cmd('hi LspDiagnosticsDefaultHint gui=undercurl')
vim.cmd('hi LspDiagnosticsDefaultWarning gui=undercurl')
vim.cmd('hi LspDiagnosticsDefaultError gui=undercurl')

-- Curly lines
vim.cmd('autocmd ColorScheme * highlight LspDiagnosticsUnderlineHint gui=undercurl')
vim.cmd('autocmd ColorScheme * highlight LspDiagnosticsUnderlineWarning gui=undercurl')
vim.cmd('autocmd ColorScheme * highlight LspDiagnosticsUnderlineError gui=undercurl')

lspzero.preset({
  virt_text = true,
  suggest_lsp_servers = true,
  setup_servers_on_start = true,
  configure_diagnostics = true,
  cmp_capabilities = true,
  manage_nvim_cmp = true,
  call_servers = 'local',
  set_lsp_keymaps = { preserve_mappings = true, omit = {} },
  sign_icons = {
    error = "",
    warn = "",
    hint = "",
    info = "",
  }
})

-- RUST Config
local rust_lsp = lspzero.build_options('rust_analyzer', {
  single_file_support = false,
  on_attach = function(client, bufnr)
    print('hello rust-tools')
  end
})

lspzero.nvim_workspace()
lspzero.setup()

require('rust-tools').setup({ server = rust_lsp })
