local colorscheme = "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. "not found")
  return
end

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
