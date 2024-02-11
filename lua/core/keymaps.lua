vim.g.mapleader = " "
local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "x", '"_x')

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

-- copy all
keymap.set("n", "<leader>ca", 'gg"*yG')
