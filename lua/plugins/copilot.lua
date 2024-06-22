-- [nfnl] Compiled from fnl/plugins/copilot.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local function _2_()
  vim.keymap.set("i", "<C-J>", "copilot#Accept('\\<CR>')", {expr = true, replace_keycodes = false})
  vim.g.copilot_no_tab_map = true
  return nil
end
return {{"github/copilot.vim", config = _2_}}
