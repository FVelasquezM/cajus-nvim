-- [nfnl] fnl/plugins/paredit.fnl
local function _1_()
  local paredit = require("nvim-paredit")
  return paredit.setup({keys = {["<localleader>k"] = {paredit.api.delete_form, "Delete a form"}}})
end
local function _2_()
  local surround = require("nvim-surround")
  return surround.setup()
end
local function _3_()
  local autopairs = require("nvim-autopairs")
  local lisps = {"clojure", "fennel"}
  autopairs.setup({})
  for _, quote_char in ipairs({"'", "`"}) do
    for _0, rule in ipairs(autopairs.get_rules(quote_char)) do
      rule.not_filetypes = vim.list_extend((rule.not_filetypes or {}), lisps)
    end
  end
  return autopairs.force_attach()
end
return {{"julienvincent/nvim-paredit", lazy = true, ft = {"clojure", "fennel"}, config = _1_}, {"kylechui/nvim-surround", event = "VeryLazy", config = _2_}, {"windwp/nvim-autopairs", event = "InsertEnter", config = _3_}}
