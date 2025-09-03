-- CodeCompanion: AI-powered coding assistant for Neovim
-- GitHub: https://github.com/olimorris/codecompanion.nvim

return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'hrsh7th/nvim-cmp', -- Optional: for completion
    'nvim-telescope/telescope.nvim', -- Optional: for actions
    {
      'stevearc/dressing.nvim', -- Optional: for better UI
      opts = {},
    },
  },
  config = function()
    -- Configuration is loaded from custom/opts/codecompanion.lua
    -- This keeps the plugin file clean and separates concerns
    local codecompanion = require 'codecompanion'
    codecompanion.setup(require('opts.ai.codecompanion').config)
  end,
}
