local configs = {
	"colorscheme",
	"lualine",
	"bufferline",
	"nvim-tree",
	"whichkey",
	"telescope",
}

for _, config in ipairs(configs) do
	require("ricing." .. config)
end
