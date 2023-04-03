local configs = {
	"treesitter",
	"autopairs",
	"colorizer",
	"lspconfig",
	"lspkind",
	"completion",
	-- "lspsaga",
}

for _, config in ipairs(configs) do
	require("coding." .. config)
end
