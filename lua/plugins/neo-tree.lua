-- [nfnl] fnl/plugins/neo-tree.fnl
local function _1_()
  vim.keymap.set("n", "<leader>n", ":Neotree toggle filesystem reveal left<CR>", {})
  local function _2_()
    if (vim.fn.argc() == 0) then
      return vim.cmd(":Neotree filesystem reveal left")
    else
      return nil
    end
  end
  return vim.api.nvim_create_autocmd("VimEnter", {callback = _2_})
end
return {{"nvim-neo-tree/neo-tree.nvim", branch = "v3.x", dependencies = {"nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim"}, config = _1_}}
