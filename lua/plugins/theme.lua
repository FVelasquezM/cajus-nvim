-- [nfnl] Compiled from fnl/plugins/theme.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local function _2_()
  local catppuccin = require("catppuccin")
  catppuccin.setup({flavour = "mocha"})
  return vim.cmd("colorscheme catppuccin")
end
return {{"catppuccin/nvim", name = "catppuccin", priority = 1000, config = _2_}}
