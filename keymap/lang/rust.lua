local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'rust',
  callback = function()
    keymap('n', '<leader>rr', ':w<CR>:!rustc % && ./%:r<CR>', opts)
    keymap('n', '<leader>rc', ':w<CR>:!cargo run<CR>', opts)
  end,
})