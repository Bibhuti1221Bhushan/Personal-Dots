-- IMPORT LUALINE PLUGIN SAFELY
local status, lualine = pcall(require, "lualine")
if not status then
  return
end

-- CONFIGURE LUALINE
lualine.setup({
  options = {
    icons_enabled = true,
    theme = 'catppuccin',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {},
    lualine_c = {
      {
        'filename',
        color = { fg = '#a6adc8', bg = '#313244', gui='bold' },
        file_status = true,      -- DISPLAYS FILE STATUS (READONLY STATUS, MODIFIED STATUS)
        newfile_status = true,   -- DISPLAY NEW FILE STATUS (NEW FILE MEANS NO WRITE AFTER CREATED)
        path = 3,                -- 0: ONLY FILENAME 1: RELATIVE PATH 3: ABSOLUTE PATH + HOME DIRECTORY
        shorting_target = 40,    -- SHORTENS PATH TO LEAVE 40 SPACES IN THE WINDOW
        symbols = {
          modified = '- 󰌵',      -- TEXT TO SHOW WHEN THE FILE IS MODIFIED.
          readonly = '- 󰻂',      -- TEXT TO SHOW WHEN THE FILE IS NON-MODIFIABLE OR READONLY.
          unnamed = ' NO NAME ', -- TEXT TO SHOW FOR UNNAMED BUFFERS.
          newfile = ' NEW ',     -- TEXT TO SHOW FOR NEWLY CREATED FILE BEFORE FIRST WRITE
        }
      }
    },
    lualine_x = {
      {
        'fileformat',
        color = { fg = '#a6adc8', bg = '#363a4f', gui='bold' },
        symbols = {
          unix = '  ', 
          dos = ' 󱪈 ',  
          mac = '  ',  
        }
      }
    },
    lualine_y = {},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {},
    lualine_x = {'location', 'encoding', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
})
