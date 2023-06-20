-- IMPORT LSPSAGA SAFELY
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
  return
end

saga.setup({
  -- KEYBINDS FOR NAVIGATION IN LSPSAGA WINDOW
  scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
  -- USE ENTER TO OPEN FILE WITH DEFINITION PREVIEW
  definition = {
    edit = "<CR>",
  },
  ui = {
    colors = {
      normal_bg = "#022746",
    },
  },
})
