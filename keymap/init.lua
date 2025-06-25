-- custom/keymap/init.lua

-- Load language-specific keymaps
require 'custom.keymap.lang'

-- Place your custom keymaps here
-- Example:
-- vim.keymap.set('n', '<leader>y', '"+y', { desc = 'Yank to system clipboard' })
-- Add your custom keymaps below

local opts = { noremap = true, silent = true }
local nopts = { noremap = true, silent = false }
local keymap = vim.api.nvim_set_keymap

-- Remap hjkl keys as in the referenced repo
keymap('', 'j', 'h', opts)
keymap('', ';', 'l', opts)
keymap('', 'k', 'k', opts)
keymap('', 'l', 'j', opts)

-- Save file
keymap('n', '<leader>w', ':w<CR>', opts)

-- Scroll up and down
keymap('n', '<C-d>', '<C-d>zz', opts)
keymap('n', '<C-u>', '<C-u>zz', opts)

-- Center cursor after search
keymap('n', 'n', 'nzzzv', opts)
keymap('n', 'N', 'Nzzzv', opts)

-- Switch between buffers
keymap('n', '<leader>bb', ':bnext<CR>', opts)

-- Highlight wen  yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('custom-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 200 }
  end,
})

-- Use jk to exit insert mode
keymap('i', 'jk', '<Esc>', opts)

-- Comment Plugin
keymap('n', '<leader>/', "<ESC><cmd>lua require('Comment.api').toggle.linewise.current()<cr>", opts)
keymap('v', '<leader>/', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)

