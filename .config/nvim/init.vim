set number
set tabstop=2
set softtabstop=0 noexpandtab
set shiftwidth=2
set termguicolors

"---Get Vim-Plug if not present----

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME}/nvim/autoload/plug.vim"'))
	silent !mkdir -p ${XDG_CONFIG_HOME}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

"---Plugins----
call plug#begin('~/.config/nvim/plugged')

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()

"---Aesthetics----

"color scheme
let g:tokyonight_style = "night"
colorscheme tokyonight

"Nvim-Colorizer
lua require('colorizer').setup()

"Lualine
lua require('lualine').setup()

"Mapping
map <C-n> :NERDTreeToggle<CR>
map <C-c> :ColorizerToggle<CR>
