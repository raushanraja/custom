-- Only add keymap if editing a JavaScript or Node.js file
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  callback = function()
    keymap('n', '<leader>rn', ':w<CR>:!node %<CR>', opts)
    keymap('n', '<leader>rt', ':w<CR>:!npm test<CR>', opts)
    keymap('n', '<leader>rb', ':w<CR>:!npm run build<CR>', opts)
  end,
})
