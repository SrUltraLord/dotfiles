return {
  -- Init screen
  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    lazy = false,
    config = function()
      require('dashboard').setup {}
    end,
    dependencies = {
      { 'nvim-tree/nvim-web-devicons' }
    },
  },

  -- Better popup menus
  { 'stevearc/dressing.nvim' },

  -- Notifications
  {
    "rcarriga/nvim-notify",
    config = function()
      local notify = require("notify")
      -- this for transparency
      notify.setup({ background_colour = "#000000" })
      -- this overwrites the vim notify function
      vim.notify = notify.notify
    end
  },

  -- Theme
  {
    -- "folke/tokyonight.nvim",
    "catppuccin/nvim",
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.termguicolors = true
      -- vim.cmd.colorscheme("tokyonight-moon")
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },

  -- Upper bar
  {
    "utilyre/barbecue.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "smiteshp/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional
    },
    config = function()
      require("barbecue").setup()
    end,
  },

  -- NeoTree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<c-b>",     "<cmd>Neotree toggle<cr>", desc = "Toggle Neotree" },
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Neotree alt" },
      { "<c-e>",     "<cmd>Neotree focus<cr>",  desc = "Focus Neotree" }
    }
  },

  -- Context Navigation
  {
    'simrat39/symbols-outline.nvim',
    keys = {
      { '<leader>a', '<cmd>SymbolsOutline<cr>' }
    },
    opts = {
      highlight_hovered_item = true,
      show_guides = true,
      auto_preview = false,
      position = 'right',
      relative_width = true,
      width = 25,
      auto_close = false,
      show_numbers = false,
      show_relative_numbers = false,
      show_symbol_details = true,
      preview_bg_highlight = 'Pmenu',
      autofold_depth = nil,
      auto_unfold_hover = true,
      fold_markers = { '', '' },
      wrap = false,
      keymaps = {
        -- These keymaps can be a string or a table for multiple keys
        close = { "<Esc>", "q" },
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        toggle_preview = "K",
        rename_symbol = "r",
        code_actions = "a",
        fold = "h",
        unfold = "l",
        fold_all = "W",
        unfold_all = "E",
        fold_reset = "R",
      },
      lsp_blacklist = {},
      symbol_blacklist = {},
      symbols = {
        File = { icon = "", hl = "@text.uri" },
        Module = { icon = "", hl = "@namespace" },
        Namespace = { icon = "", hl = "@namespace" },
        Package = { icon = "", hl = "@namespace" },
        Class = { icon = "𝓒", hl = "@type" },
        Method = { icon = "ƒ", hl = "@method" },
        Property = { icon = "", hl = "@method" },
        Field = { icon = "", hl = "@field" },
        Constructor = { icon = "", hl = "@constructor" },
        Enum = { icon = "ℰ", hl = "@type" },
        Interface = { icon = "ﰮ", hl = "@type" },
        Function = { icon = "", hl = "@function" },
        Variable = { icon = "", hl = "@constant" },
        Constant = { icon = "", hl = "@constant" },
        String = { icon = "𝓐", hl = "@string" },
        Number = { icon = "#", hl = "@number" },
        Boolean = { icon = "⊨", hl = "@boolean" },
        Array = { icon = "", hl = "@constant" },
        Object = { icon = "⦿", hl = "@type" },
        Key = { icon = "🔐", hl = "@type" },
        Null = { icon = "NULL", hl = "@type" },
        EnumMember = { icon = "", hl = "@field" },
        Struct = { icon = "𝓢", hl = "@type" },
        Event = { icon = "🗲", hl = "@type" },
        Operator = { icon = "+", hl = "@operator" },
        TypeParameter = { icon = "𝙏", hl = "@parameter" },
        Component = { icon = "", hl = "@function" },
        Fragment = { icon = "", hl = "@constant" },
      },
    }
  },

  -- Status line
  {
    "feline-nvim/feline.nvim",
    config = function()
      require("feline").setup {
        components = require("catppuccin.groups.integrations.feline").get(),
      }
    end,
  },

  -- Guide lines
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup({
        space_char_blankline = " ",
        show_current_context = true,
        indent = 1,
      })
    end
  }
}
