return {
  {
    'sindrets/diffview.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = { 'DiffviewOpen', 'DiffviewFileHistory', 'DiffviewClose' },
    keys = {
      { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = '[G]it [D]iffview' },
      { '<leader>gh', '<cmd>DiffviewFileHistory<cr>', desc = '[G]it [H]istory' },
      { '<leader>gH', '<cmd>DiffviewFileHistory %<cr>', desc = '[G]it current file [H]istory' },
      { '<leader>gc', '<cmd>DiffviewClose<cr>', desc = '[G]it [C]lose diffview' },
    },
    opts = {
      enhanced_diff_hl = true,
      -- Keymaps are now handled in keymap/core/git.lua
    },
  },
}
