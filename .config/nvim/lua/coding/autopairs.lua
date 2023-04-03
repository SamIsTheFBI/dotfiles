local status, autopairs = pcall(require, 'nvim-autopairs')
if (not status) then return end

autopairs.setup({
	enable_check_bracket_line = true,
	disable_filetype = { 'TelescopePrompt', 'vim' },
})
