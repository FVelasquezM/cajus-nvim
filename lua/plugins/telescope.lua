-- [nfnl] fnl/plugins/telescope.fnl
local function _1_()
  local builtin
  local function _2_()
    return require("telescope.builtin")
  end
  builtin = _2_
  local function _3_()
    return builtin().find_files()
  end
  vim.keymap.set("n", "<leader>ff", _3_, {desc = "Find files"})
  local function _4_()
    return builtin().live_grep()
  end
  vim.keymap.set("n", "<leader>fg", _4_, {desc = "Live grep"})
  local function _5_()
    return builtin().buffers()
  end
  vim.keymap.set("n", "<leader>fb", _5_, {desc = "Buffers"})
  local function _6_()
    return builtin().help_tags()
  end
  return vim.keymap.set("n", "<leader>fh", _6_, {desc = "Help tags"})
end
local function _7_()
  local telescope = require("telescope")
  local themes = require("telescope.themes")
  telescope.setup({defaults = {file_ignore_patterns = {"node_modules"}, vimgrep_arguments = {"rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case", "--iglob", "!.git", "--hidden"}}, extensions = {["ui-select"] = {themes.get_dropdown({})}}, pickers = {find_files = {find_command = {"rg", "--files", "--iglob", "!.git", "--hidden"}}}})
  return telescope.load_extension("ui-select")
end
return {{"nvim-telescope/telescope.nvim", dependencies = {"nvim-telescope/telescope-ui-select.nvim", "nvim-lua/plenary.nvim"}, init = _1_, config = _7_}}
