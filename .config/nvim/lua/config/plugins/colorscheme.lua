-- SET COLORSCHEME TO NIGHTFLY WITH PROTECTED CALL
-- IN CASE IT ISN'T INSTALLED
local status, _ = pcall(vim.cmd, "colorscheme catppuccin")
if not status then
  print("Color-Scheme Not Found!") -- PRINT ERROR IF COLORSCHEME NOT INSTALLED
  return
end
