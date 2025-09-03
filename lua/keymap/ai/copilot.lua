-- Copilot keymaps
-- Global keymaps for Copilot panel and status

vim.keymap.set('n', '<leader>cp', function()
  require('copilot.panel').open()
end, { desc = 'Open Copilot Panel' })

vim.keymap.set('n', '<leader>ct', ':Copilot toggle<CR>', { desc = 'Toggle Copilot' })
vim.keymap.set('n', '<leader>cs', ':Copilot status<CR>', { desc = 'Copilot Status' })

-- Auto-hide copilot suggestions when blink.cmp menu is open
vim.api.nvim_create_autocmd('User', {
  pattern = 'BlinkCmpMenuOpen',
  callback = function()
    vim.b.copilot_suggestion_hidden = true
  end,
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'BlinkCmpMenuClose',
  callback = function()
    vim.b.copilot_suggestion_hidden = false
  end,
})

-- vim: ts=2 sts=2 sw=2 et
