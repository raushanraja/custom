local M = {}

--[[
====================
Function: copy_line_diagnostics_with_location
====================
]]
-- Function to copy diagnostic message to clipboard
function M.copy_line_diagnostics_with_location()
  -- Get diagnostics for the current line
  local current_line = vim.fn.line '.'
  local diagnostics = vim.diagnostic.get(0, { lnum = current_line - 1 })

  if vim.tbl_isempty(diagnostics) then
    vim.notify('No diagnostics on the current line.', vim.log.levels.INFO)
    return
  end

  -- Get the filename (relative to current working directory)
  local filename = vim.fn.expand '%'

  -- Collect all diagnostic messages
  local messages = {}
  for _, d in ipairs(diagnostics) do
    table.insert(messages, d.message)
  end
  local diagnostic_text = table.concat(messages, '; ') -- Join multiple diagnostics with a semicolon

  -- Format the final string
  local output_string = string.format('%s:%d:%s', filename, current_line, diagnostic_text)

  -- Copy the formatted string to the clipboard register (+)
  vim.fn.setreg('+', output_string)
  vim.notify('Copied diagnostics to clipboard!', vim.log.levels.INFO)
end
--[[
====================
End Function: copy_line_diagnostics_with_location
====================
]]

return M
