return {
  {
    -- GitHub Copilot integration for blink.cmp
    'giuxtaposition/blink-cmp-copilot',
    dependencies = {
      'zbirenbaum/copilot.lua',
      'saghen/blink.cmp',
    },
    event = 'InsertEnter',
    config = function()
      -- Load copilot configuration from external file
      local copilot_opts = require 'opts.ai.copilot'

      -- Setup copilot.lua with external configuration
      require('copilot').setup(copilot_opts)
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
