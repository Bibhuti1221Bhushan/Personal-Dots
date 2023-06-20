-- SET LEADER KEY TO SPACE
vim.g.mapleader = " "

local keymap = vim.keymap -- FOR CONCISENESS

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

keymap.set("n", "<leader>to", ":tabnew<CR>") -- OPEN NEW TAB
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- CLOSE CURRENT TAB
keymap.set("n", "<leader>tn", ":tabn<CR>") --  GO TO NEXT TAB
keymap.set("n", "<leader>tp", ":tabp<CR>") --  GO TO PREVIOUS TAB

----------------------
-- PLUGIN KEYBINDS
----------------------

-- VIM-MAXIMIZER
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- TOGGLE SPLIT WINDOW MAXIMIZATION

-- NVIM-TREE
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- TOGGLE FILE EXPLORER

-- TELESCOPE
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- FIND FILES WITHIN CURRENT WORKING DIRECTORY, RESPECTS .GITIGNORE
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- FIND STRING IN CURRENT WORKING DIRECTORY AS YOU TYPE
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- FIND STRING UNDER CURSOR IN CURRENT WORKING DIRECTORY
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- LIST OPEN BUFFERS IN CURRENT NEOVIM INSTANCE
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- LIST AVAILABLE HELP TAGS

-- RESTART LSP SERVER 
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- MAPPING TO RESTART LSP IF NECESSARY
