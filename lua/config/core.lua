--core settings
vim.cmd("let g:netrw_liststyle = 3") --file explorer settings

local opt = vim.opt
--keymap
vim.g.mapleader = ' '

--number
opt.number = true
opt.relativenumber = true

--tabs
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

--wrap
opt.wrap = false

--search
opt.ignorecase = true
opt.smartcase = true

--gutter
opt.signcolumn = "yes"

--inline diagnostics
vim.diagnostic.config({
    virtual_text = true
})

--cursorline
opt.cursorline = true

--color
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
