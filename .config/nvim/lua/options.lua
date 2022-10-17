local options = {
  clipboard = "unnamedplus",
  fileencoding = "utf-8",
  ignorecase = true,
  smartcase = true,
  smartindent = true,
  swapfile = false,
  backup = false,
  writebackup = false,
  mouse = "a",
  showtabline = 2,
  number = true,
  hlsearch = true,
  shiftwidth = 2,
  tabstop = 2,
  cursorline = true,
	wrap = false,
	undofile = true,
	splitright = 	true,
	splitbelow = true,
	termguicolors = true,
	showtabline = 2,
	--signcolumn = "yes",
	scrolloff = 3,
	sidescrolloff = 5,
	timeoutlen = 300,
}

for j, k in pairs(options) do
  vim.opt[j] = k
end

vim.cmd [[set whichwrap+=<,>,[,],h,l]]
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]]
