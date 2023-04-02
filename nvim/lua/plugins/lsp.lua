-- EYE CANDY
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
      prefix = "",
      spacing = 2,
    },
    signs = true,
    underline = true,
  }
)

-- Curly lines
vim.cmd("autocmd ColorScheme * highlight LspDiagnosticsUnderlineHint gui=undercurl")
vim.cmd("autocmd ColorScheme * highlight LspDiagnosticsUnderlineWarning gui=undercurl")
vim.cmd("autocmd ColorScheme * highlight LspDiagnosticsUnderlineError gui=undercurl")

return {
  "VonHeikemen/lsp-zero.nvim",
  lazy = false,
  dependencies = {
    -- LSP Support
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },

    -- Autocompletion
    { "hrsh7th/nvim-cmp", lazy = false },
    { "hrsh7th/cmp-buffer", lazy = false  },
    { "hrsh7th/cmp-path", lazy = false  },
    { "saadparwaiz1/cmp_luasnip", lazy = false  },
    { "hrsh7th/cmp-nvim-lsp", lazy = false  },
    { "hrsh7th/cmp-nvim-lua", lazy = false  },

    -- Snippets
    { "L3MON4D3/LuaSnip", lazy = false  },
    { "rafamadriz/friendly-snippets", lazy = false  },
  },
  config = function()
    local lspconfig = require('lspconfig')
    local lspzero = require("lsp-zero")

    lspzero.ensure_installed({
      "html",
      "eslint",
      "tsserver",
      "volar",
      "rust_analyzer"
    })

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
  end
}
