local status, wk = pcall(require, 'which-key')
if (not status) then return end

local mappings = {
  {
    mode = { "n", "v" },
    { "<leader>q", "<cmd>q<cr>", desc = "Quit" },
    { "<leader>Q", "<cmd>q!<cr>", desc = "Force Quit" },
    { "<leader>gc", "<cmd>!g++ -fsanitize=address -std=gnu++20 -O2 -Wall \"%\" -o a<cr>", desc = "Compile C++ code" },
    { "<leader>tw", "<cmd>set wrap!<cr>", desc = "Toggle Word Wrap" },
    { "<leader>tc", "<cmd>ColorizerToggle<cr>", desc = "Toggle Colorizer" },
    { "<leader>w", "<cmd>w!<cr>", desc = "Save" },
    { "<leader>h", "<cmd>noh<cr>", desc = "Stop Highlight" },
    { "<leader>gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Go to Definition" },
  }
}

wk.add(mappings)
