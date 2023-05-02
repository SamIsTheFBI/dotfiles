local status, wk = pcall(require, 'which-key')
if (not status) then return end

local mappings = {
	q = { ":q<CR>", "Quit" },
	Q = { ":q!<CR>", "Force quit" },
	gc = { ":!gcc -o a \"%\" -lm<CR>", "Compile C code" },
	gp = { ":!g++ -fsanitize=address -std=gnu++20 -O2 -Wall \"%\" -o a<CR>", "Compile C++ code" },
	tc = { ":ColorizerToggle<CR>", "Toggle Colorizer" },
	tw = { ":set wrap!<CR>", "Toggle word wrap" },
	td = { "wbi\"<ESC>wea\"<ESC>", "Add double quotes around current word" },
	ts = { "wbi'<ESC>wea'<ESC>", "Add single quotes around current word" },
	w = { ":w<CR>", "Save" },
	h = { ":noh<CR>", "stop highlight" },
	W = { ":wq<CR>", "Save & quit" },
	rn = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename occurrence" },
}
local opts = { prefix = '<leader>' }

wk.register(mappings, opts)
