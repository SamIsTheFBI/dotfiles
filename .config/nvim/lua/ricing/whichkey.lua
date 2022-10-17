local wk = require("which-key")
local mappings = {
	q = {":q<CR>", "Quit"},
	Q = {":q!<CR>", "Force quit"},
	w = {":w<CR>", "Save"},
	W = {":wq!<CR>", "Save & quit"},
}
local opts = {prefix = '<leader>'}

wk.register(mappings, opts)

