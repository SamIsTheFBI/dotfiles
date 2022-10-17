local configs = {
 "treesitter",
 "autopairs",
}

for _, config in ipairs(configs) do
    require("coding." .. config)
end
