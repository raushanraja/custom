-- Plugin Configuration Entry Point
-- This file orchestrates the loading of all plugin configurations

local M = {

  -- Core plugins (essential for functionality)
  { import = 'plugins.core' },
  -- require 'plugins.core.colorscheme',
  -- require 'plugins.core.completion',
  -- require 'plugins.core.lsp',
  -- require 'plugins.core.treesitter',
  -- require 'plugins.core.telescope',

  { import = 'plugins.ui' },
  -- UI/UX plugins
  -- require 'plugins.ui.bufferline',
  -- require 'plugins.ui.neo-tree',
  -- require 'plugins.ui.trouble',
  -- require 'plugins.ui.gitsigns',
  --

  { import = 'plugins.dev' },
  -- -- Development tools
  -- require 'plugins.dev.comment',
  -- require 'plugins.dev.conform',
  -- require 'plugins.dev.todo-comments',
  -- require 'plugins.dev.toggleterm',
  --

  { import = 'plugins.ai' },
  -- -- AI/ML plugins
  -- require 'plugins.ai.copilot',
  -- require 'plugins.ai.codecompanion',
  --

  { import = 'plugins.utils' },
  -- -- Utility plugins
  -- require 'plugins.utils.snacks',
}

require('lazy').setup(M, {
  checker = { enabled = false }, -- Disable automatic plugin update checks
  performance = {
    rtp = {
      -- Disable some rtp plugins for performance
      disabled_plugins = {
        'gzip',
        'matchit',
        'matchparen',
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
})
