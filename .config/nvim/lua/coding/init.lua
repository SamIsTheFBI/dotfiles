local configs = {
  "treesitter",
  "autopairs",
  "colorizer",
  "lspconfig",
  "lspkind",
  "completion",
  "mason",
  "lspsaga",
}

for _, config in ipairs(configs) do
  require("coding." .. config)
end
