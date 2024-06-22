-- [nfnl] Compiled from fnl/plugins/neo-tree.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local function _2_()
  vim.keymap.set("n", "<leader>n", ":Neotree toggle filesystem reveal left<CR>", {})
  local function _3_()
    return vim.cmd(":Neotree filesystem reveal left")
  end
  return vim.api.nvim_create_autocmd("VimEnter", {callback = _3_})
end
return {{"nvim-neo-tree/neo-tree.nvim", branch = "v3.x", dependencies = {"nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim", "3rd/image.nvim"}, config = _2_}}
