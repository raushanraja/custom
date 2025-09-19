-- Custom Snippet Keymaps
-- This file sets up custom keymaps for snippet navigation

local ls = require 'luasnip'

-- Add custom filetypes if needed
ls.filetype_extend('javascript', { 'javascriptreact', 'typescript', 'typescriptreact' })
ls.filetype_extend('python', { 'python' })

-- Custom keymaps for better snippet control
vim.keymap.set({ 'i', 's' }, '<C-l>', function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<C-h>', function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<C-e>', function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })
