-----------------------------------------------------------
-- [[ Setting colorscheme and other commands ]]
-----------------------------------------------------------
local cmd = {
  colorscheme = 'bluloco',
}
-- Apply commands
for command, value in pairs(cmd) do
  vim.cmd(string.format('%s %s', command, value))
end
-----------------------------------------------------------
-- [[ end ]]
-----------------------------------------------------------
