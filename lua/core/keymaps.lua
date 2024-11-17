vim.g.mapleader = " "
local keymap = vim.keymap

-- local sino = {silent = true, noremap = true}
keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>nh", ":nohl<CR>")
-- no clipboard overwrite
keymap.set("n", "x", '"_x')
keymap.set("x", "<leader>p", "\"_dP")

-- split window vertically
keymap.set("n", "<leader>sv", "<C-w>v")
-- split window horizontally
keymap.set("n", "<leader>sh", "<C-w>s")
-- make split windows equal width
keymap.set("n", "<leader>se", "<C-w>=")
-- close current split window
keymap.set("n", "<leader>sx", ":close<CR>")

-- open new tab
keymap.set("n", "<leader>to", ":tabnew<CR>")
-- close current tab
keymap.set("n", "<leader>tx", ":tabclose<CR>")
-- go to next tab
keymap.set("n", "<leader>tn", ":tabn<CR>")
-- go to previous tab
keymap.set("n", "<leader>tp", ":tabp<CR>")

-- drag selected
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- copy all
keymap.set("n", "<leader>ca", "ggyG")
