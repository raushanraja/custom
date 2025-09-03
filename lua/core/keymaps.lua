-- Core Keymaps Configuration
-- This module sets up the basic key mappings

local M = {}

local opts = { noremap = true, silent = true }
local nopts = { noremap = true, silent = false }
local keymap = vim.api.nvim_set_keymap

-- Leader key mappings
keymap('n', '<leader>w', ':w<CR>', opts)
keymap('n', '<leader>q', ':q<CR>', opts)
keymap('n', '<leader>x', ':x<CR>', opts)

-- Better window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Resize windows
keymap('n', '<C-Up>', ':resize -2<CR>', opts)
keymap('n', '<C-Down>', ':resize +2<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Navigate buffers
keymap('n', '<S-l>', ':bnext<CR>', opts)
keymap('n', '<S-h>', ':bprevious<CR>', opts)
keymap('n', '<leader>bd', ':bdelete<CR>', opts)

-- Clear highlights
keymap('n', '<ESC>', ':nohlsearch<CR>', opts)

-- Better search navigation
keymap('n', 'n', 'nzzzv', opts)
keymap('n', 'N', 'Nzzzv', opts)

-- Better scrolling
keymap('n', '<C-d>', '<C-d>zz', opts)
keymap('n', '<C-u>', '<C-u>zz', opts)

-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Move text up and down
keymap('v', '<A-j>', ':m .+1<CR>==', opts)
keymap('v', '<A-k>', ':m .-2<CR>==', opts)
keymap('v', 'p', '"_dP', opts)

-- Visual block mode
keymap('x', 'J', ":move '>+1<CR>gv-gv", opts)
keymap('x', 'K', ":move '<-2<CR>gv-gv", opts)
keymap('x', '<A-j>', ":move '>+1<CR>gv-gv", opts)
keymap('x', '<A-k>', ":move '<-2<CR>gv-gv", opts)

-- Terminal mode
keymap('t', '<C-h>', '<C-\\><C-N><C-w>h', opts)
keymap('t', '<C-j>', '<C-\\><C-N><C-w>j', opts)
keymap('t', '<C-k>', '<C-\\><C-N><C-w>k', opts)
keymap('t', '<C-l>', '<C-\\><C-N><C-w>l', opts)

-- Insert mode navigation
keymap('i', '<C-h>', '<Left>', opts)
keymap('i', '<C-j>', '<Down>', opts)
keymap('i', '<C-k>', '<Up>', opts)
keymap('i', '<C-l>', '<Right>', opts)

-- Quick exit insert mode
keymap('i', 'jk', '<ESC>', opts)
keymap('i', 'kj', '<ESC>', opts)

-- Command mode navigation
keymap('c', '<C-h>', '<Left>', nopts)
keymap('c', '<C-j>', '<Down>', nopts)
keymap('c', '<C-k>', '<Up>', nopts)
keymap('c', '<C-l>', '<Right>', nopts)

-- Diagnostic navigation
keymap('n', '<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
keymap('n', '<leader>dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
keymap('n', '<leader>df', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

-- LSP actions
keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('custom-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 200 }
  end,
})

return M
