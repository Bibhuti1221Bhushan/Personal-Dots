-- IMPORT NVIM-TREE PLUGIN SAFELY
local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  return
end

-- RECOMMENDED SETTINGS FROM NVIM-TREE DOCUMENTATION
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- CHANGE COLOR FOR ARROWS IN TREE TO LIGHT BLUE
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

-- CONFIGURE NVIM-TREE
nvimtree.setup({
  -- CHANGE FOLDER ARROW ICONS
  renderer = {
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "", -- ARROW WHEN FOLDER IS CLOSED
          arrow_open = "", -- ARROW WHEN FOLDER IS OPEN
        },
      },
    },
  },
  -- DISABLE WINDOW_PICKER FOR
  -- EXPLORER TO WORK WELL WITH
  -- WINDOW SPLITS
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
})

-- OPEN NVIM-TREE ON SETUP

local function open_nvim_tree(data)
  -- BUFFER IS A [NO NAME]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  -- BUFFER IS A DIRECTORY
  local directory = vim.fn.isdirectory(data.file) == 1

  if not no_name and not directory then
    return
  end

  -- CHANGE TO THE DIRECTORY
  if directory then
    vim.cmd.cd(data.file)
  end

  -- OPEN THE TREE
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
