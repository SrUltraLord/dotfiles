local icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}

return {
  "hrsh7th/nvim-cmp",
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = {
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
          cmp.config.window.bordered(),
        },
        icons = icons
      },
      formatting = {
        format = function(entry, vim_item)
          vim_item.kind = string.format('%s %s', icons[vim_item.kind], vim_item.kind)

          vim_item.menu = ({
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
            nvim_lua = "[Lua]",
            latex_symbols = "[LaTeX]",
          })[entry.source.name]

          return vim_item
        end
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-i>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
      }),
      sources = {
        { name = 'tsserver' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'tailwindcss' },
        { name = 'tailwindcss' },
        { name = 'astro' },
        { name = 'eslint' },
        { name = 'html' },
        { name = 'rust_analyzer' },
        { name = 'json_ls' },
        { name = 'emmet_ls' },
        { name = 'cssls' }
      }
    })
  end,
}
