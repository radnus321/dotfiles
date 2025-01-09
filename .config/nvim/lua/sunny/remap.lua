vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "kj", "<Esc>")
vim.keymap.set("n", "<leader>p", [["+p]])
-- Move lines in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- Copy and Paste to + register
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.api.nvim_set_keymap('n', '<C-c>', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-v>', '"+P', { noremap = true, silent = true })
vim.keymap.set("n", "<C-i>", "<C-w>v")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<tab>", "")
vim.keymap.set("v", "<tab>", ">gv")
vim.keymap.set("v", "i<tab>", "<gv")
