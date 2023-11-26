local g = vim.g
local opt = vim.opt
local api = vim.api
local cmd = vim.cmd

g.mapleader = ' '
g.markdown_fenced_languages = {'html', 'python', 'lua', 'vim', 'typescript', 'js=javascript'}
opt.number = true
opt.relativenumber = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.undofile = true
opt.iskeyword:remove('_', '')
api.nvim_set_option("clipboard", "unnamed")
cmd("colorscheme kanagawa")
