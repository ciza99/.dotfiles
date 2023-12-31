local opt = vim.opt

-- encoding
vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- line numbers
opt.relativenumber = true
vim.wo.number = true

-- scrolling
opt.scrolloff = 12

-- cursor
opt.guicursor = ""
opt.cursorline = true

-- column for lsp icons
opt.signcolumn = "yes"

-- update more frequently
opt.updatetime = 100

-- hightlight yanked text for short time
vim.cmd([[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
  augroup END
]])

-- tabs and indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- search
opt.ignorecase = true
opt.smartcase = true

-- line wrapping
opt.wrap = false

-- visuals
opt.termguicolors = true

-- windows
opt.splitright = true
opt.splitbelow = true

-- clipboard
opt.clipboard:append("unnamedplus")

-- leader key
vim.g.mapleader = " "

-- take `-` as part of words
opt.iskeyword:append("-")
