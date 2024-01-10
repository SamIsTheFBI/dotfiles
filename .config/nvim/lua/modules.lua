-- load modules
local modules = {
  "coding",
  "ricing",
}

for _, mod in ipairs(modules) do
  require("" .. mod)
end
