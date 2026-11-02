-- [nfnl] fnl/plugins/lsp.fnl
vim.diagnostic.config({severity_sort = true, update_in_insert = true, underline = true, float = {border = "single"}, signs = {text = {[vim.diagnostic.severity.ERROR] = "\239\129\151", [vim.diagnostic.severity.WARN] = "\239\129\177", [vim.diagnostic.severity.INFO] = "\239\129\154", [vim.diagnostic.severity.HINT] = "\239\129\153"}}, virtual_text = false})
local function on_attach(ev)
  local map
  local function _1_(mode, lhs, rhs, desc)
    return vim.keymap.set(mode, lhs, rhs, {buffer = ev.buf, desc = desc})
  end
  map = _1_
  local telescope
  local function _2_()
    return require("telescope.builtin")
  end
  telescope = _2_
  map("n", "gd", vim.lsp.buf.definition, "Go to definition")
  map("n", "K", vim.lsp.buf.hover, "Hover documentation")
  map("n", "<leader>ld", vim.lsp.buf.declaration, "Go to declaration")
  map("n", "<leader>lt", vim.lsp.buf.type_definition, "Go to type definition")
  map("n", "<leader>lh", vim.lsp.buf.signature_help, "Signature help")
  map("n", "<leader>ln", vim.lsp.buf.rename, "Rename")
  map("n", "<leader>le", vim.diagnostic.open_float, "Line diagnostics")
  map("n", "<leader>lq", vim.diagnostic.setloclist, "Diagnostics to loclist")
  map("n", "<leader>lf", vim.lsp.buf.format, "Format buffer")
  local function _3_()
    return vim.diagnostic.jump({count = 1, float = true})
  end
  map("n", "<leader>lj", _3_, "Next diagnostic")
  local function _4_()
    return vim.diagnostic.jump({count = -1, float = true})
  end
  map("n", "<leader>lk", _4_, "Previous diagnostic")
  map({"n", "x"}, "<leader>la", vim.lsp.buf.code_action, "Code action")
  local function _5_()
    return telescope().diagnostics()
  end
  map("n", "<leader>lw", _5_, "Workspace diagnostics")
  local function _6_()
    return telescope().lsp_references()
  end
  map("n", "<leader>lr", _6_, "References")
  local function _7_()
    return telescope().lsp_implementations()
  end
  return map("n", "<leader>li", _7_, "Implementations")
end
local function _8_()
  local cmplsp = require("cmp_nvim_lsp")
  vim.lsp.config("*", {capabilities = cmplsp.default_capabilities()})
  vim.api.nvim_create_autocmd("LspAttach", {group = vim.api.nvim_create_augroup("cajus-lsp", {}), callback = on_attach})
  return vim.lsp.enable({"clojure_lsp"})
end
return {{"neovim/nvim-lspconfig", dependencies = {"hrsh7th/cmp-nvim-lsp"}, config = _8_}}
