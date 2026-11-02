-- [nfnl] fnl/plugins/theme.fnl
local function _1_()
  local theme = require("tokyonight")
  local function _2_(colors)
    colors.bg = "#2d2d34"
    return nil
  end
  local function _3_(highlight, colors)
    highlight.DiagnosticUnnecessary = {fg = "#8d91a4"}
    highlight.String = {fg = colors.green2}
    highlight.TelescopeNormal = {bg = colors.bg_statusline, fg = colors.fg_dark}
    highlight.TelescopeBorder = {bg = colors.bg_statusline, fg = colors.fg_dark}
    highlight.NeoTreeNormal = {bg = colors.bg_statusline, fg = colors.fg_dark}
    highlight.NeoTreeNormalNC = {bg = colors.bg_statusline, fg = colors.fg_dark}
    highlight.NeoTreeWinSeparator = {bg = colors.bg_statusline, fg = colors.bg_dark}
    highlight.FloatBorder = {bg = colors.bg_statusline, fg = colors.fg_dark}
    highlight.ColorColumn = {bg = colors.bg_statusline, fg = colors.fg_dark}
    highlight.Pmenu = {bg = colors.bg_statusline, fg = colors.fg_dark}
    return nil
  end
  theme.setup({style = "night", styles = {comments = {italic = true}, floats = "dark", functions = {}, keywords = {italic = true}, sidebars = "dark", variables = {}}, on_colors = _2_, on_highlights = _3_, terminal_colors = true})
  return vim.cmd("colorscheme tokyonight")
end
return {{"folke/tokyonight.nvim", priority = 1000, dependencies = {"nvim-tree/nvim-web-devicons"}, config = _1_, lazy = false}}
