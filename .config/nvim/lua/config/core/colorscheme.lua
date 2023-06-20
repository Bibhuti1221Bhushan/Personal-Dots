-- SET COLORSCHEME TO NIGHTFLY WITH PROTECTED CALL
-- IN CASE IT ISN'T INSTALLED
local status, _ = pcall(vim.cmd, "colorscheme onedark")
if not status then
  print("Colorscheme not found!") -- PRINT ERROR IF COLORSCHEME NOT INSTALLED
  return
end
