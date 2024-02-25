local configs = {
  "colorscheme",
  "lualine",
  "bufferline",
  "nvim-tree",
  "whichkey",
  "telescope",
  -- "breadcrumb",
}

for _, config in ipairs(configs) do
  require("ricing." .. config)
end
