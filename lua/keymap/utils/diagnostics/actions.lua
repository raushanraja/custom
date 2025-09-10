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

--[[
--==================
Function: Search and Replace
--==================
]]

function M.project_replace()
  vim.ui.input({ prompt = 'Search for: ' }, function(search_term)
    if not search_term or search_term == '' then
      return
    end

    vim.ui.input({ prompt = 'Replace with: ' }, function(replace_term)
      if not replace_term then
        return
      end

      require('telescope.builtin').live_grep {
        default_text = search_term,
        attach_mappings = function(prompt_bufnr, map)
          map('i', '<C-r>', function(bufnr)
            local picker = require('telescope.actions.state').get_current_picker(bufnr)
            local selected_entries = picker:get_multi_selection()

            require('telescope.actions').close(bufnr)

            if vim.tbl_isempty(selected_entries) then
              print 'No files selected for replacement.'
              return
            end

            local formatted_items = {}
            for _, entry in ipairs(selected_entries) do
              table.insert(formatted_items, {
                filename = entry.filename,
                lnum = entry.lnum,
                col = entry.col,
                text = entry.text
              })
            end

            vim.fn.setqflist({}, 'r', {
              title = 'Project Replace (Selected)',
              items = formatted_items,
            })

            local escaped_search = vim.fn.escape(search_term, '/')
            local escaped_replace = vim.fn.escape(replace_term, '/')

            -- Run the replacement command
            local cmd = string.format('cfdo %%s/%s/%s/g | update', escaped_search, escaped_replace)
            print('Running command:', cmd)
            print('Number of files in quickfix:', #vim.fn.getqflist())
            
            local success, err = pcall(vim.cmd, cmd)
            if not success then
              print('Error during replacement:', err)
              return
            end

            -- Write all changed buffers to disk
            vim.cmd 'wa'

            print 'Replacement complete. All changes saved.'
          end)
          return true
        end,
      }
    end)
  end)
end
--[[
==================
End Function: Search and Replace
--==================
]]

return M
