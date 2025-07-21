return {
  'akinsho/bufferline.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  version = '*',
  opts = {
    options = {
      mode = 'buffers',
      -- style_preset = bufferline.style_preset.default, -- | bufferline.style_preset.minimal,
      themable = true, -- | false,
      numbers = 'ordinal', -- | "buffer_id" | "both" | function({ ordinal, id, ... }): string,
      close_command = 'bdelete! %d', -- can be a string | function, see "Mouse actions"
      right_mouse_command = 'bdelete! %d', -- can be a string | function, see "Mouse actions"
      left_mouse_command = 'buffer %d', -- can be a string | function, see "Mouse actions"
      middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
      indicator = {
        -- icon = '▎',
        style = 'underline',
      },
      buffer_close_icon = '󰅖',
      modified_icon = '●',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',
      max_name_length = 18,
      max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
      truncate_names = true,
      tab_size = 18,
      diagnostics = 'nvim_lsp', -- | "coc",
      diagnostics_update_in_insert = false,
      -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
      --   return "("..count..")"
      -- end,
      -- NOTE: this will be removed in a future release. Please use `show_buffer_indicators`
      -- show_buffer_icons = true, -- | false,
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      show_duplicate_prefix = true, -- | false,
      persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
      -- can also be a table containing 2 custom separators
      -- [focused and unfocused]. eg: { '|', '|' }
      separator_style = 'thin', -- | "thick" | "thin" | { 'any', 'any' },
      enforce_regular_tabs = false,
      always_show_bufferline = true,
      -- sort_by = 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
      --   -- add custom logic
      --   return buffer_a.modified > buffer_b.modified
      -- end
    },
  },
  config = function(_, opts)
    require('bufferline').setup(opts)
    -- Add keymaps
    -- vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer', noremap = true, silent = true })
    -- vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer', noremap = true, silent = true })
  end,
}
