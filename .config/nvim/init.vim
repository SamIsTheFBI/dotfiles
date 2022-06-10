set number
set relativenumber
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set termguicolors
set mouse=a

"---Get Vim-Plug if not present----
:function! SomeCheck()
if empty(glob("~/.config/nvim/autoload/plug.vim"))
	execute '!echo ""mkdir -p ~/.config/nvim/autoload && mkdir -p ~/.config/nvim/plugged && wget -O ~/.config/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall
endif
:endfunction

call SomeCheck()

"---Plugins----
call plug#begin('~/.config/nvim/plugged')

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'morhetz/gruvbox'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'numToStr/Comment.nvim'
Plug 'Pocco81/AutoSave.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/coc.nvim'
Plug 'arcticicestudio/nord-vim'

call plug#end()

"---Aesthetics----

"color scheme
let g:tokyonight_style = "night"
"colorscheme tokyonight
" colorscheme gruvbox
colorscheme nord

hi Normal guibg=NONE ctermbg=NONE

lua require('colorizer').setup()
lua require('lualine').setup()
lua require('bufferline').setup()
lua require('nvim-tree').setup() 
lua require("indent_blankline").setup()
lua require('Comment').setup()
" lua require('nvim-autopairs').setup()

" lua << EOF
" local autosave = require("autosave")
"
" autosave.setup(
"     {
"         enabled = true,
"         execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
"         events = {"InsertLeave", "TextChanged"},
"         conditions = {
"             exists = true,
"             filename_is_not = {},
"             filetype_is_not = {},
"             modifiable = true
"         },
"         write_all_buffers = false,
"         on_off_commands = true,
"         clean_command_line_interval = 0,
"         debounce_delay = 135
"     }
" )
" EOF
lua << EOF
require("nvim-web-devicons").set_icon {
  html = {
	  icon = "",
	  color = "#DD4B25",
	  name = "html"
	  },
  css = {
	  icon = "",
	  color = "#3D8FC6",
	  name = "css"
	  },
  deb = {
	  icon = "",
	  name = "deb",
	  },
  Dockerfile = {
	  icon = "",
	  color = "#019BC6";
	  name = "Dockerfile",
	  },
  jpeg = {
	  icon = "",
	  name = "jpeg",
	  },
  jpg = {
	  icon = "",
	  name = "jpg",
	  },
  js = {
	  icon = "",
	  color = "#F0DB4F";
	  name = "js",
	  },
  kt = {
	  icon = "󱈙",
	  name = "kt",
	  },
  lock = {
	  icon = "",
	  name = "lock",
	  },
  lua = {
	  icon = "",
	  color = "#000080";
	  name = "lua",
	  },
  mp3 = {
	  icon = "",
	  name = "mp3",
	  },
  mp4 = {
	  icon = "",
	  name = "mp4",
	  },
  out = {
	  icon = "",
	  name = "out",
	  },
  png = {
	  icon = "",
	  name = "png",
	  },
  py = {
	  icon = "",
	  name = "py",
	  },
  ["robots.txt"] = {
	  icon = "ﮧ",
	  name = "robots",
	  },
  toml = {
	  icon = "",
	  name = "toml",
	  },
  ts = {
	  icon = "ﯤ",
	  color = "#007ACC";
	  name = "ts",
	  },
  ttf = {
	  icon = "",
	  name = "TrueTypeFont",
	  },
  rb = {
	  icon = "",
	  color = "#D91404";
	  name = "rb",
	  },
  rpm = {
	  icon = "",
	  name = "rpm",
	  },
  vue = {
	  icon = "﵂",
	  color = "#41B883";
	  name = "vue",
	  },
  woff = {
	  icon = "",
	  name = "WebOpenFontFormat",
	  },
  woff2 = {
	  icon = "",
	  name = "WebOpenFontFormat2",
	  },
  xz = {
	  icon = "",
	  name = "xz",
	  },
  zip = {
	  icon = "",
	  name = "zip",
	  },
}
EOF

"coc config
let g:coc_global_extensions = [ 'coc-pairs']

"---Mapping----

map <C-q> :NvimTreeClose<CR>:BufferLineCyclePrev<CR>:q<CR>
map <C-n> :NvimTreeFindFileToggle<CR>
map <C-c> :ColorizerToggle<CR>
map <M-Left> :BufferLineCyclePrev<CR>
map <M-Right> :BufferLineCycleNext<CR>
map <C-x><C-w> :bd<CR>:NvimTreeToggle<CR>:NvimTreeToggle<CR><C-w><C-w> 
map <C-x><C-d> :set wrap!<CR>
