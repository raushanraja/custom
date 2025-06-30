local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  callback = function()
    keymap('n', '<leader>rp', ':w<CR>:!python3 %<CR>', opts)
  end,
})
