-- Lualine
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.black, bg = colors.black },
  },
  insert = { a = { fg = colors.black, bg = colors.blue } },
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
    config = {
      options = {
        theme = bubbles_theme,
        component_separators = '|',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = {
          { 'mode', separator = { left = '' }, right_padding = 2 },
        },
        lualine_b = { 'filename', 'branch' },
        lualine_c = { 'fileformat' },
        lualine_x = {},
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
          { 'location', separator = { right = '' }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      tabline = {},
      extensions = {},
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
