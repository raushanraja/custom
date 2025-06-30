local nonopts = { noremap = true, silent = false }
local keymapset = vim.keymap.set
keymapset({ 'n', 'i', 'v', 't' }, '<C-`>', '<cmd>ToggleTerm<cr>', nonopts)
