-- [nfnl] fnl/config/init.fnl
vim.keymap.set("n", "<space>", "<nop>")
do
  local options = {expandtab = true, tabstop = 2, shiftwidth = 2, softtabstop = 2, completeopt = "menuone,noselect", ignorecase = true, smartcase = true, clipboard = "unnamedplus", number = true, ruler = true, signcolumn = "number", winborder = "single"}
  for option, value in pairs(options) do
    vim.o[option] = value
  end
end
return {}
