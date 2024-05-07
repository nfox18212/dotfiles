require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<C-g>", "<Cmd>:Neogit<CR>")
map("n", "<C-.>", "<Cmd>:NvimTreeToggle<CR>")
map("n", "<C-z>", "<Cmd>:NvimTreeFocus<CR>")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
