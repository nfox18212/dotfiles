require "nvchad.options"

-- add yours here!

local o = vim.opt
-- o.cursorlineopt ='both' -- to enable cursorline!

o.termguicolors = true
vim.g.loaded_netrwPlugin = true
vim.g.loaded_netrw = true
-- vim tab width
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
vim.bo.softtabstop = 2

vim.o.shell = "/bin/zsh -i"
