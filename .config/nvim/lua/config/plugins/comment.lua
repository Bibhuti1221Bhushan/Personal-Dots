-- IMPORT COMMENT PLUGIN SAFELY
local setup, comment = pcall(require, "Comment")
if not setup then
  return
end

-- ENABLE COMMENT
comment.setup()
