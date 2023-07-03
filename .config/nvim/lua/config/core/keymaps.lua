-- SET LEADER KEY TO SPACE
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- VARIABLE FOR CONCISENESS
local keymap = vim.keymap 

---------------------
-- GENERAL KEYMAPS
---------------------

-- USE JK / ESC TO EXIT INSERT MODE
keymap.set("i", "jk", "<ESC>") 

-- COPY TO CLIPBOARD
keymap.set("n", "<leader>y", "<+y>")

-- PASTE FROM CLIPBOARD
keymap.set("n", "<leader>p", "+p")

-- CLEAR SEARCH HIGHLIGHTS
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- DELETE SINGLE CHARACTER WITHOUT COPYING INTO REGISTER
keymap.set("n", "x", '"_x')

-- INCREMENT/DECREMENT NUMBERS
keymap.set("n", "<leader>+", "<C-a>") -- INCREMENT
keymap.set("n", "<leader>-", "<C-x>") -- DECREMENT

-- WINDOW MANAGEMENT
keymap.set("n", "<leader>sv", "<C-w>v") -- SPLIT WINDOW VERTICALLY
keymap.set("n", "<leader>sh", "<C-w>s") -- SPLIT WINDOW HORIZONTALLY
keymap.set("n", "<leader>se", "<C-w>=") -- MAKE SPLIT WINDOWS EQUAL WIDTH & HEIGHT
keymap.set("n", "<leader>sx", ":close<CR>") -- CLOSE CURRENT SPLIT WINDOW

-- TAB MANAGEMENT
keymap.set("n", "<leader>to", ":tabnew<CR>") -- OPEN NEW TAB
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- CLOSE CURRENT TAB
keymap.set("n", "<leader>tn", ":tabn<CR>") --  GO TO NEXT TAB
keymap.set("n", "<leader>tp", ":tabp<CR>") --  GO TO PREVIOUS TAB
