-- Keymap Configuration Entry Point
-- This file orchestrates the loading of all keymap configurations

local M = {}

-- Load core keymaps (navigation, basic operations)
require 'keymap.core.buffer'

-- Load plugin-specific keymaps
require 'keymap.dev.toggleterm'
require 'keymap.ai.copilot'
require 'keymap.ai.codecompanion'
require 'keymap.utils.snacks'
require 'keymap.utils.diagnostics'

-- Load language-specific keymaps
require 'keymap.lang'

-- keymaps can be added here
-- Example:
-- vim.keymap.set('n', '<leader>y', '"+y', { desc = 'Yank to system clipboard' })

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- navigation (vim-style hjkl remapping)
keymap('', 'j', 'h', opts)
keymap('', ';', 'l', opts)
keymap('', 'k', 'k', opts)
keymap('', 'l', 'j', opts)

-- Additional keymaps
keymap('n', '<leader>bb', ':bnext<CR>', opts)

-- Comment plugin keymaps
keymap('n', '<leader>/', "<ESC><cmd>lua require('Comment.api').toggle.linewise.current()<cr>", opts)
keymap('v', '<leader>/', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)

-- Diagnostic navigation
keymap('n', '<leader>tn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
keymap('n', '<leader>tp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)

-- LSP actions
keymap('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

return M
