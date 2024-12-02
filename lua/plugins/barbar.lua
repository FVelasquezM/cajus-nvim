-- [nfnl] Compiled from fnl/plugins/barbar.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local function _2_()
  local default_opts = {noremap = true, silent = true}
  vim.api.nvim_set_keymap("n", "<A-,>", "<Cmd>BufferPrevious<CR>", default_opts)
  vim.api.nvim_set_keymap("n", "<A-.>", "<Cmd>BufferNext<CR>", default_opts)
  return vim.api.nvim_set_keymap("n", "<A-c>", "<Cmd>BufferClose<CR>", default_opts)
end
return {{"romgrk/barbar.nvim", dependencies = {"lewis6991/gitsigns.nvim", "nvim-tree/nvim-web-devicons"}, version = "^1.0.0", config = _2_}}
