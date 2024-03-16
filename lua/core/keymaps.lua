---- set the leader key as space key ----
vim.g.mapleader = " "

local keymap = vim.keymap

---- move the selected lines in visual mode ----
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

---- no highlighting ----
keymap.set("n", "<leader>nh", ":nohl<CR>")

---- move cursor in splited windows ----
keymap.set("n", "<leader>k", "<C-w>k")
keymap.set("n", "<leader>j", "<C-w>j")
keymap.set("n", "<leader>h", "<C-w>h")
keymap.set("n", "<leader>l", "<C-w>l")

---- plugins ----
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
