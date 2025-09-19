return {
  'folke/tokyonight.nvim',
  'cpea2506/one_monokai.nvim',
  'ribru17/bamboo.nvim',
  {
    'uloco/bluloco.nvim',
    dependencies = { 'rktjmp/lush.nvim' },
    config = function()
      vim.g.bluloco_style = 'dark'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
