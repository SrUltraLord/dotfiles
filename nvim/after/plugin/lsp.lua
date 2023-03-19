local lspconfig = require('lspconfig')
local lspzero = require('lsp-zero')

lspzero.ensure_installed({
  'html',
  'eslint',
  'tsserver',
  'volar',
  'rust_analyzer'
})

lspzero.preset({
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
