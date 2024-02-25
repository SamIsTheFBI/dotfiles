local status, saga = pcall(require, 'lspsaga')
if (not status) then return end

saga.setup({
  ui = {
    enable = false,
    sign = false,
    code_action = '',
  }
})

local opts = { noremap = true, silent = false }
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<cr>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', opts)
vim.keymap.set('n', '<C-K>', '<Cmd>Lspsaga signature_help<cr>', opts)
vim.keymap.set('n', 'gP', '<Cmd>Lspsaga peek_definition<cr>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<cr>', opts)
