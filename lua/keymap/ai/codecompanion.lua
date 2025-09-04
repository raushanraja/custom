-- CodeCompanion keymaps
-- Organized keymaps for CodeCompanion AI assistant

-- Helper function for setting keymaps with consistent options
local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Main CodeCompanion actions
map('n', '<leader>cc', '<cmd>CodeCompanionActions<cr>', { desc = 'CodeCompanion: Actions' })
map('v', '<leader>cc', '<cmd>CodeCompanionActions<cr>', { desc = 'CodeCompanion: Actions' })

-- Chat interface
map('n', '<leader>ccc', '<cmd>CodeCompanionChat Toggle<cr>', { desc = 'CodeCompanion: Toggle Chat' })
map('v', '<leader>ccc', '<cmd>CodeCompanionChat Toggle<cr>', { desc = 'CodeCompanion: Toggle Chat' })
map('n', '<leader>cca', '<cmd>CodeCompanionChat Add<cr>', { desc = 'CodeCompanion: Add to Chat' })

-- Inline code assistance
map('n', '<leader>cci', '<cmd>CodeCompanion<cr>', { desc = 'CodeCompanion: Inline Assistant' })
map('v', '<leader>cci', '<cmd>CodeCompanion<cr>', { desc = 'CodeCompanion: Inline Assistant' })

-- Quick actions for selected code
map('v', '<leader>cce', '<cmd>CodeCompanionChat Explain<cr>', { desc = 'CodeCompanion: Explain Code' })
map('v', '<leader>cct', '<cmd>CodeCompanionChat Generate Tests<cr>', { desc = 'CodeCompanion: Generate Tests' })
map('v', '<leader>cco', '<cmd>CodeCompanion Optimize Code<cr>', { desc = 'CodeCompanion: Optimize Code' })
map('v', '<leader>ccf', '<cmd>CodeCompanion Fix Code<cr>', { desc = 'CodeCompanion: Fix Code' })
map('v', '<leader>ccm', '<cmd>CodeCompanion Add Comments<cr>', { desc = 'CodeCompanion: Add Comments' })

-- Custom prompts
map('n', '<leader>ccp', '<cmd>CodeCompanion Custom Prompt<cr>', { desc = 'CodeCompanion: Custom Prompt' })
map('v', '<leader>ccp', '<cmd>CodeCompanion Custom Prompt<cr>', { desc = 'CodeCompanion: Custom Prompt' })

-- Advanced features
map('n', '<leader>ccl', '<cmd>CodeCompanionChat Load<cr>', { desc = 'CodeCompanion: Load Chat' })
map('n', '<leader>ccs', '<cmd>CodeCompanionChat Save<cr>', { desc = 'CodeCompanion: Save Chat' })

-- Alternative key bindings for quick access
map('n', '<C-c>', '<cmd>CodeCompanionActions<cr>', { desc = 'CodeCompanion: Quick Actions' })
map('v', '<C-c>', '<cmd>CodeCompanionActions<cr>', { desc = 'CodeCompanion: Quick Actions' })

-- Generate commit message from git diff
map('n', '<leader>ccm', '<cmd>CodeCompanion /commit<cr>', { desc = 'CodeCompanion: Generate Commit Message' })

-- Additional convenience functions
-- Function to quickly ask about current buffer
map('n', '<leader>ccb', function()
  local codecompanion = require 'codecompanion'
  codecompanion.chat 'What does this file do?'
end, { desc = 'CodeCompanion: Ask about current buffer' })

-- Function to review current line
map('n', '<leader>ccr', function()
  local codecompanion = require 'codecompanion'
  local line = vim.api.nvim_get_current_line()
  codecompanion.inline('Explain this line: ' .. line)
end, { desc = 'CodeCompanion: Review current line' })

local function start_chat_with_selection_or_line()
  local text_to_send

  -- Check if we are in visual mode by checking for the visual selection marks
  if vim.fn.mode(1) == 'v' or vim.fn.mode(1) == 'V' then
    -- Get the start and end line numbers of the visual selection
    local start_line = vim.fn.line "'<"
    local end_line = vim.fn.line "'>"
    -- Read the lines from the buffer
    local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
    -- Join them with spaces to create a single prompt string
    text_to_send = table.concat(lines, ' ')
  else
    -- Otherwise, we're in normal mode, so just get the current line
    text_to_send = vim.fn.getline '.'
  end

  -- Make sure we have text before sending
  if text_to_send and not text_to_send:match '^%s*$' then
    -- Prompt user for additional input
    vim.ui.input({ prompt = 'Additional prompt (optional): ' }, function(user_input)
      if user_input and user_input ~= '' then
        text_to_send = text_to_send .. ' ' .. user_input
      end
      -- Send to CodeCompanionChat
      vim.cmd('CodeCompanionChat ' .. text_to_send)
    end)
  else
    vim.notify('No text selected or current line is empty.', vim.log.levels.INFO, { title = 'CodeCompanion' })
  end
end

-- Keymap to start chat with selected text or current line
-- Works in both normal and visual modes

map({ 'n', 'v' }, '<leader>cb', start_chat_with_selection_or_line, {
  desc = 'CodeCompanion: Chat with selection or line',
})
