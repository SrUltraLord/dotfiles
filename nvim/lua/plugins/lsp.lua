return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      {
        "williamboman/mason.nvim",
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { "williamboman/mason-lspconfig.nvim" },

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },

      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },

      -- Snippets
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
    },
    config = function()
      local lspzero = require("lsp-zero")

      lspzero.preset({
        virt_text = true,
        suggest_lsp_servers = true,
        setup_servers_on_start = true,
        configure_diagnostics = true,
        cmp_capabilities = true,
        call_servers = 'local',
        set_lsp_keymaps = { preserve_mappings = true, omit = {} },
        sign_icons = {
          error = "",
          warn = "",
          hint = "",
          info = "",
        }
      })

      -- Virtal Text Config
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

      lspzero.setup()
    end
  },

  -- Autocompletion
  { "hrsh7th/cmp-nvim-lsp",         lazy = false },
  { "hrsh7th/cmp-nvim-lua",         lazy = false },
  { "hrsh7th/cmp-buffer",           lazy = false },
  { "hrsh7th/cmp-path",             lazy = false },
  { "saadparwaiz1/cmp_luasnip",     lazy = false },

  -- Snippets
  { "L3MON4D3/LuaSnip",             lazy = false },
  { "rafamadriz/friendly-snippets", lazy = false },
}
