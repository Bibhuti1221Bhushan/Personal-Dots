-- IMPORT GIT-SIGNS PLUGIN SAFELY
local setup, gitsigns = pcall(require, "gitsigns")
if not setup then
  return
end

-- CONFIGURE/ENABLE GIT-SIGNS
gitsigns.setup()
