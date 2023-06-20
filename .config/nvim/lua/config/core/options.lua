local opt = vim.opt -- FOR CONCISENESS

-- GENERAL
opt.iskeyword:append("-") -- CONSIDER STRING-STRING AS WHOLE WORD
opt.swapfile = false

-- MOUSE
opt.mousemodel = "extend" -- ENABLE ONLU MOUSE SELECTIONS 

-- LINE NUMBERS
opt.relativenumber = true -- SHOW RELATIVE LINE NUMBERS
opt.number = true -- SHOWS ABSOLUTE LINE NUMBER ON CURSOR LINE (WHEN RELATIVE NUMBER IS ON)

-- TABS & INDENTATION
opt.tabstop = 2 -- 2 SPACES FOR TABS (PRETTIER DEFAULT)
opt.shiftwidth = 2 -- 2 SPACES FOR INDENT WIDTH
opt.expandtab = true -- EXPAND TAB TO SPACES
opt.autoindent = true -- COPY INDENT FROM CURRENT LINE WHEN STARTING NEW ONE

-- LINE WRAPPING
opt.wrap = false -- DISABLE LINE WRAPPING

-- SEARCH SETTINGS
opt.ignorecase = true -- IGNORE CASE WHEN SEARCHING
opt.smartcase = true -- IF YOU INCLUDE MIXED CASE IN YOUR SEARCH, ASSUMES YOU WANT CASE-SENSITIVE

-- CURSOR LINE
opt.cursorline = true -- HIGHLIGHT THE CURRENT CURSOR LINE

-- APPEARANCE
opt.termguicolors = true -- (HAVE TO USE ITERM2 OR ANY OTHER TRUE COLOR TERMINAL)
opt.background = "dark" -- COLORSCHEMES THAT CAN BE LIGHT OR DARK WILL BE MADE DARK
opt.signcolumn = "yes" -- SHOW SIGN COLUMN SO THAT TEXT DOESN'T SHIFT

-- BACKSPACE
opt.backspace = "indent,eol,start" -- ALLOW BACKSPACE ON INDENT, END OF LINE OR INSERT MODE START POSITION

-- CLIPBOARD
opt.clipboard:append("unnamedplus") -- USE SYSTEM CLIPBOARD AS DEFAULT REGISTER

-- SPLIT WINDOWS
opt.splitright = true -- SPLIT VERTICAL WINDOW TO THE RIGHT
opt.splitbelow = true -- SPLIT HORIZONTAL WINDOW TO THE BOTTOM

