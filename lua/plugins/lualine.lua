-- [nfnl] fnl/plugins/lualine.fnl
local lsp_progress_message = ""
local function lsp_progress()
  return lsp_progress_message
end
local function track_lsp_progress(ev)
  do
    local value
    local _2_
    do
      local t_1_ = ev
      if (nil ~= t_1_) then
        t_1_ = t_1_.data
      else
      end
      if (nil ~= t_1_) then
        t_1_ = t_1_.params
      else
      end
      if (nil ~= t_1_) then
        t_1_ = t_1_.value
      else
      end
      _2_ = t_1_
    end
    value = (_2_ or {})
    if (value.kind == "end") then
      lsp_progress_message = ""
    else
      local _6_
      if value.message then
        _6_ = (" : " .. value.message)
      else
        _6_ = ""
      end
      local _8_
      if value.percentage then
        _8_ = (" : " .. value.percentage .. "%%")
      else
        _8_ = ""
      end
      lsp_progress_message = ((value.title or "") .. _6_ .. _8_)
    end
  end
  vim.cmd.redrawstatus()
  return nil
end
local function _11_()
  vim.api.nvim_create_autocmd("LspProgress", {group = vim.api.nvim_create_augroup("cajus-lualine", {}), callback = track_lsp_progress})
  local lualine = require("lualine")
  return lualine.setup({options = {theme = "auto", icons_enabled = true, section_separators = {"", ""}, component_separators = {"", ""}}, sections = {lualine_a = {}, lualine_b = {{"mode", {upper = true}}}, lualine_c = {"branch", {"filename", file_status = true, path = 1, shorting_target = 40}}, lualine_x = {{"diagnostics", sections = {"error", "warn", "info", "hint"}, sources = {"nvim_diagnostic"}}, lsp_progress, "location", "filetype"}, lualine_y = {"encoding"}, lualine_z = {}}, inactive_sections = {lualine_a = {}, lualine_b = {}, lualine_c = {{"filename", file_status = true, path = 1}}, lualine_x = {}, lualine_y = {}, lualine_z = {}}})
end
return {{"nvim-lualine/lualine.nvim", config = _11_}}
