local configs = {
 "colorscheme",
 "lualine",
 "bufferline",
 "nvim-tree",
 "whichkey",
}

for _, config in ipairs(configs) do
    require("ricing." .. config)
end
