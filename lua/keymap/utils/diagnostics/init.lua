local M = require 'keymap.utils.diagnostics.actions'

-- Keymap to copy diagnostics on the current line with location
vim.keymap.set('n', '<leader>tc', M.copy_line_diagnostics_with_location, {
  noremap = true,
  silent = true,
  desc = 'Copy diagnostics on current line with location',
})

-- Keymap to perform project-wide search and replace
vim.keymap.set('n', '<leader>sr', M.project_replace, {
  noremap = true,
  silent = true,
  desc = 'Project-wide Find & Replace',
})
