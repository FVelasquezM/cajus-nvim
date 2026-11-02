-- [nfnl] fnl/plugins/copilot.fnl
local function _1_()
  vim.keymap.set("i", "<C-J>", "copilot#Accept('\\<CR>')", {expr = true, replace_keycodes = false})
  vim.g.copilot_no_tab_map = true
  return nil
end
return {{"github/copilot.vim", config = _1_}}
