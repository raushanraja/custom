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

-- Add which-key group descriptions if which-key is available
-- NOTE: Commented out since which-key is not installed
--[[
local ok, wk = pcall(require, 'which-key')
if ok then
  wk.register({
    ['<leader>cc'] = {
      name = '[C]ode[C]ompanion',
      c = 'Toggle Chat',
      a = 'Add to Chat',
      i = 'Inline Assistant',
      e = 'Explain Code',
      t = 'Generate Tests',
      o = 'Optimize Code',
      f = 'Fix Code',
      m = 'Add Comments',
      p = 'Custom Prompt',
      l = 'Load Chat',
      s = 'Save Chat',
    },
  }, { mode = 'n' })
  
  wk.register({
    ['<leader>cc'] = {
      name = '[C]ode[C]ompanion',
      c = 'Toggle Chat',
      i = 'Inline Assistant',
      e = 'Explain Code',
      t = 'Generate Tests',
      o = 'Optimize Code',
      f = 'Fix Code',
      m = 'Add Comments',
      p = 'Custom Prompt',
    },
  }, { mode = 'v' })
end
--]]

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
