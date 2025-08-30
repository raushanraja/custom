-- Options Configuration Entry Point
-- This file orchestrates the loading of all option configurations

local M = {}

-- Load AI tool options
require 'opts.ai.copilot'
require 'opts.ai.codecompanion'
require 'opts.core.mason'

-- Additional options can be set here
-- Example:
-- vim.opt.spell = true
-- vim.opt.spelllang = 'en_us'

return M
