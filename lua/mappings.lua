require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

local cmp = require('cmp')

cmp.setup({
  mapping = {
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    ['<C-x>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
  },
})

map("v", "<C-c>", "\"+y")
map("v", "<C-x>", "\"+x")
map("n", "<C-V>", "\"+gP")

vim.api.nvim_set_keymap('n', 'dd', '"_dd', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'dw', '"_dw', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'db', '"_db', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'x', '"_x', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'D', '"_D', { noremap = true, silent = true })
