-- GLOBAL VARIABLES
local opt = vim.opt

-- GENERAL OPTIONS
opt.autoread = true     -- AUTO READ
opt.autowrite = true    -- AUTO WRITE
opt.backspace = '2'     -- FIX BACKSPACE
opt.backup = false      -- DON'T BACKUP FILE
opt.breakindent = true  -- WRAP INDENT TO MATCH LINE START
opt.cindent = true      -- INDENT FOR LINE USING C INDENT RULE
opt.clipboard = "unnamedplus" -- SYNC WITH SYSTEM CLIPBOARD
opt.cmdheight = 0   -- REMOVE BOTTOM SPACE
opt.completeopt = "menu,menuone,noselect" -- COMPLETION SUGGESTION
opt.conceallevel = 3 -- HIDE * MARKUP FOR BOLD AND ITALIC
opt.confirm = true -- CONFIRM TO SAVE CHANGES BEFORE EXIT
opt.copyindent = true -- COPY THE PREVIOUS INDENTATION 
opt.cursorline = true -- ENABLE HIGHLIGHTING OF THE CURRENT LINE
opt.expandtab = true -- USE SPACES INSTEAD OF TABS
opt.fillchars = { eob = " " } -- DISABLE `~` ON NONEXISTENT LINES
opt.grepformat = "%f:%l:%c:%m" -- FORMAT TO RECOGNIZE FOR "GREP" OUTPUT
opt.grepprg = "rg --vimgrep" -- GREP THINGS
opt.history = 50 -- NUMBER OF COMMANDS TO REMEMBER IN A HISTORY TABLE
opt.ignorecase = true -- IGNORE CASE IN PATTERN
opt.inccommand = "nosplit" -- PREVIEW INCREMENTAL SUBSTITUTE
opt.infercase = true -- IGNORE CASES IN KEYWORD COMPLETION
opt.laststatus = 0 -- DISABLE STATUS LINE IN LAST WINDOW
opt.linebreak = true -- WRAP LINES AT 'BREAK-AT'
opt.list = false -- SHOW SOME INVISIBLE CHARACTERS (TABS...
opt.mouse = "a" -- ENABLE MOUSE MODE IN ALL MODE
opt.number = true -- SHOW LINE NUMBER
opt.preserveindent = true -- PRESERVE INDENT STRUCTURE AS MUCH AS POSSIBLE
opt.pumblend = 10 -- TRANSPARENCY LEVEL OF POP-UP (RMB)
opt.pumheight = 10 -- MAXIMUM NUMBER OF ENTRIES IN A POP-UP (RMB)
opt.relativenumber = false -- RELATIVE LINE NUMBERS
opt.scrolloff = 5 -- NUMBER OF LINES TO KEEP ABOVE AND BELOW THE CURSOR
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" } -- CHANGE EFFECTS OF SESSION
opt.shiftround = true -- ROUND INDENT TO MULTIPLE
opt.shiftwidth = 2 -- SIZE OF AN INDENT
opt.showmatch = true  -- SHOW MATCH WHILE EDITING OF [{()}]
opt.showcmd = true -- SHOW COMMAND IN LAST LINE OF SCREEN
opt.showmode = false -- DONT SHOW MODE SINCE WE HAVE A STATUSLINE
opt.shortmess:append({ W = true, I = true, c = true }) -- DISABLE NEOVIM START PAGE
opt.sidescrolloff = 8 -- COLUMNS OF CONTEXT
opt.signcolumn = "yes" -- ALWAYS SHOW THE SIGNCOLUMN, OTHERWISE IT WOULD SHIFT THE TEXT EACH TIME
opt.smartcase = true -- DON'T IGNORE CASE WITH CAPITALS
opt.smartindent = true -- INSERT INDENTS AUTOMATICALLY
opt.smarttab = true -- SMART TAB
opt.softtabstop = -1 -- IF NEGATIVE, SHIFT-WIDTH VALUE IS USED
opt.spelllang = { "en" } -- CHECK SPELL LANGUAGE
opt.splitbelow = true -- PUT NEW WINDOWS BELOW CURRENT
opt.splitright = true -- PUT NEW WINDOWS RIGHT OF CURRENT
opt.swapfile = false -- DON'T SAVE BUFFER IN SWAP FILE
opt.tabstop = 4 -- NUMBER OF SPACES TABS COUNT 
opt.termguicolors = true -- TERMINAL TRUE COLOR SUPPORT
opt.timeoutlen = 300 -- SHORTEN KEY TIMEOUT LENGTH A LITTLE BIT FOR WHICH-KEY
opt.undofile = true -- SAVE UNDO HISTORY
opt.undolevels = 100 -- MAXIMUM NUMBER OF UNDO CAN BE DONE
opt.updatetime = 3000 -- LENGTH OF TIME TO WAIT BEFORE TRIGGERING THE PLUGIN
opt.viewoptions:remove "curdir" -- CHANGE EFFECT OF MKVIEW
opt.virtualedit = "block" -- ALLOW GOING PAST END OF LINE IN VISUAL BLOCK MODE
opt.wildmode = "longest:full,full" -- COMMAND-LINE COMPLETION MODE
opt.winminwidth = 5 -- MINIMUM WINDOW WIDTH OF OTHER WINDOW
opt.wrap = false -- DISABLE LINE WRAP
opt.writebackup = false -- DISABLE MAKING A BACKUP BEFORE OVERWRITING A FILE


-- FIX MARKDOWN INDENTATION SETTINGS
vim.g.markdown_recommended_style = 0

-- NEOVIM DISABLE MOUSE POP-UP
vim.cmd.aunmenu{'PopUp.How-to\\ disable\\ mouse'} 
vim.cmd.aunmenu{'PopUp.-1-' } 

-- DON'T SAVE SWAPFILE
vim.cmd [[ set noswapfile ]]
