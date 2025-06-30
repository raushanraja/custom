local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
local keymapset = vim.keymap.set

-- Git
keymapset('n', '<leader>gg', function()
  Snacks.lazygit()
end, opts)

keymapset('n', '<leader>gb', function()
  Snacks.git.blame_line()
end, opts)

keymapset({ 'n', 'x' }, '<leader>gB', function()
  Snacks.gitbrowse()
end, opts)

keymapset('n', '<leader>gf', function()
  Snacks.lazygit.log_file()
end, { desc = 'Lazygit Current File History' })

keymapset('n', '<leader>gl', function()
  Snacks.lazygit.log()
end, { desc = 'Lazygit Log' })

-- Zen Mode
keymapset('n', '<leader>zz', function()
  Snacks.zen()
end, opts)

-- { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
-- { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
-- Diagnostics

keymapset('n', '<leader>td', function()
  Snacks.picker.diagnostics()
end, opts)

keymapset('n', '<leader>tf', function()
  Snacks.picker.diagnostics()
end, opts)

keymapset('n', '<leader>tt', function()
  Snacks.toggle.dim()
end, opts)
