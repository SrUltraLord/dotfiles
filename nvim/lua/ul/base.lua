local g = vim.g
local o = vim.o
local opt = vim.opt

g.mapleader = " "

-- Fonts
opt.guifont = { "CaskaydiaCove NF:h12" }

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 200

-- Number of screen lines to keep above and below the cursor
o.scrolloff = 8

-- Better editor UI
o.number = true
o.numberwidth = 2
o.relativenumber = true
o.signcolumn = "yes"
o.cursorline = true

-- Better editing experience
o.expandtab = true
o.smarttab = true
o.cindent = true
o.autoindent = true
o.wrap = true
o.textwidth = 300
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = -1 -- If negative, shiftwidth value is used
opt.list = true
opt.listchars:append "space:⋅"

-- Makes neovim and host OS clipboard play nicely with each other
o.clipboard = "unnamedplus"

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false
-- o.backupdir = '/tmp/'
-- o.directory = '/tmp/'
-- o.undodir = '/tmp/'

-- Remember 50 items in commandline history
o.history = 50

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- Used by vgit.nvim
o.incsearch = false
vim.wo.signcolumn = 'yes'
opt.signcolumn = 'yes'


-- FILE FORMATTING
g.neoformat_try_node_exe = 1
vim.cmd [[autocmd BufWritePre * Neoformat]]
vim.cmd [[autocmd BufWritePre *.lua lua vim.lsp.buf.format()]]
