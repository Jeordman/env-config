-- set colorscheme and fail gracefully if not here
---@diagnostic disable-next-line: param-type-mismatch
local status, _ = pcall(vim.cmd, "colorscheme tokyonight-night")
if not status then
  print("colorscheme not found!")
  return
end
