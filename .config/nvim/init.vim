set number
set tabstop=2
set softtabstop=0 noexpandtab
set shiftwidth=2
set termguicolors

"---Get Vim-Plug if not present----
:function! SomeCheck()
if empty(glob("~/.config/nvim/autoload/plug.vim"))
	execute '!mkdir -p ~/.config/nvim/autoload && wget -O ~/.config/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall
endif
:endfunction

call SomeCheck()

"---Plugins----
call plug#begin('~/.config/nvim/plugged')

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

call plug#end()

"---Aesthetics----

"color scheme
let g:tokyonight_style = "night"
colorscheme tokyonight

"Nvim-Colorizer
lua require('colorizer').setup()

"Lualine
lua require('lualine').setup()

"Bufferline
lua require('bufferline').setup()

"Nvim-Tree
lua require('nvim-tree').setup() 
"Mapping
map <C-q> :NvimTreeClose<CR>:q<CR>
map <C-n> :NvimTreeToggle<CR>
map <C-c> :ColorizerToggle<CR>
map <M-Left> :BufferLineCyclePrev<CR>
map <M-Right> :BufferLineCycleNext<CR>
map <C-x> :bd<CR>:NvimTreeToggle<CR>:NvimTreeToggle<CR><C-w><C-w>
