-- [nfnl] fnl/plugins/treesitter.fnl
local parsers = {"bash", "clojure", "commonlisp", "dockerfile", "fennel", "html", "java", "javascript", "json", "lua", "markdown", "markdown_inline", "yaml"}
local function start_treesitter(ev)
  local lang = vim.treesitter.language.get_lang(vim.bo[ev.buf].filetype)
  if (lang and pcall(vim.treesitter.start, ev.buf, lang)) then
    if vim.treesitter.query.get(lang, "indents") then
      vim.bo[ev.buf]["indentexpr"] = "v:lua.require'nvim-treesitter'.indentexpr()"
      return nil
    else
      return nil
    end
  else
    return nil
  end
end
local function _3_()
  local treesitter = require("nvim-treesitter")
  treesitter.install(parsers)
  return vim.api.nvim_create_autocmd("FileType", {group = vim.api.nvim_create_augroup("cajus-treesitter", {}), callback = start_treesitter})
end
return {{"nvim-treesitter/nvim-treesitter", branch = "main", build = ":TSUpdate", config = _3_, lazy = false}}
