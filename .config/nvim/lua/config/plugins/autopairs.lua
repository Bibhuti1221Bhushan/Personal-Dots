-- IMPORT NVIM-AUTOPAIRS SAFELY
local autopairs_setup, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_setup then
  return
end

-- CONFIGURE AUTOPAIRS
autopairs.setup({
  check_ts = true, -- ENABLE TREESITTER
  ts_config = {
    lua = { "string" }, -- DON'T ADD PAIRS IN LUA STRING TREESITTER NODES
    javascript = { "template_string" }, -- DON'T ADD PAIRS IN JAVSCRIPT TEMPLATE_STRING TREESITTER NODES
    java = false, -- DON'T CHECK TREESITTER ON JAVA
  },
})

-- IMPORT NVIM-AUTOPAIRS COMPLETION FUNCTIONALITY SAFELY
local cmp_autopairs_setup, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not cmp_autopairs_setup then
  return
end

-- IMPORT NVIM-CMP PLUGIN SAFELY (COMPLETIONS PLUGIN)
local cmp_setup, cmp = pcall(require, "cmp")
if not cmp_setup then
  return
end

-- MAKE AUTOPAIRS AND COMPLETION WORK TOGETHER
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
