-- Lualine
local colors = {
  blue   = '#80A0FF',
  cyan   = '#79DAC8',
  black  = '#080808',
  white  = '#C6C6C6',
  red    = '#FF5189',
  violet = '#D183E8',
  grey   = '#303030',
  orange = '#F5A97F',
}

local catppuccin_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.black, bg = colors.black },
  },
  insert = { a = { fg = colors.black, bg = colors.blue } },
  command = { a = { fg = colors.black, bg = colors.orange } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },
  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}

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
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.termguicolors = true
      vim.cmd.colorscheme("tokyonight-moon")
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
      { "<c-b>", "<cmd>Neotree toggle<cr>", desc = "Toggle Neotree" },
      { "<c-e>", "<cmd>Neotree focus<cr>",  desc = "Focus Neotree" }
    }
  },

  -- Context Navigation
  {
    "stevearc/aerial.nvim",
    config = function()
      require('aerial').setup({
        backends = {
          ['_']  = { "lsp", "treesitter" },
          -- FIX: Aerial not working for these files.
          astro  = { "lsp" },
          svelte = { "lsp" },
        }
      })
    end,
    keys = {
      { "<leader>a", "<cmd>AerialToggle right<cr>", desc = "Toggle Aerial" },
    }
  },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      options = {
        icons_enabled = true,
        theme = catppuccin_theme,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
          ['neo-tree'] = {}
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
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
