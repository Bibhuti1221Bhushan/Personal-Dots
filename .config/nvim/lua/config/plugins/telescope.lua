-- IMPORT TELESCOPE PLUGIN SAFELY
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
  return
end

-- IMPORT TELESCOPE ACTIONS SAFELY
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
  return
end

-- CONFIGURE TELESCOPE
telescope.setup({
  -- CONFIGURE CUSTOM MAPPINGS
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous, -- MOVE TO PREV RESULT
        ["<C-j>"] = actions.move_selection_next, -- MOVE TO NEXT RESULT
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- SEND SELECTED TO QUICKFIXLIST
      },
    },
  },
})

telescope.load_extension("fzf")
