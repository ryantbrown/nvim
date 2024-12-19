local g = vim.g
local opt = vim.opt

-- Indentation and tabs
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.smartindent = true
opt.showtabline = 0
opt.laststatus = 0

-- Line numbers
opt.number = true
opt.relativenumber = true

-- File handling
opt.swapfile = false
opt.undofile = true
opt.undolevels = 10000

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.spelllang = { "en" }

-- Window
opt.splitright = true
opt.splitbelow = true

-- Visual
opt.showmode = false
opt.list = false
opt.listchars = { tab = ">_", trail = "·", nbsp = "+" }
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.wrap = false

-- Interaction
opt.mouse = "a"
opt.foldlevel = 99
opt.backspace = "indent,eol,start"
opt.clipboard:append("unnamedplus")

-- Plugin specific
g.snacks_animate = true
