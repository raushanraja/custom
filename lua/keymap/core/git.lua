-- Comprehensive Git and Diff workflow keymaps
-- Consolidates all git-related keymaps from gitsigns, diffview, and custom mappings

local M = {}

function M.setup()
  local opts = { noremap = true, silent = true }

  -- ============================================
  -- Diffview Operations
  -- ============================================

  -- Main diffview commands
  vim.keymap.set('n', '<leader>do', '<cmd>DiffviewOpen<cr>', opts)
  vim.keymap.set('n', '<leader>dc', '<cmd>DiffviewClose<cr>', opts)
  vim.keymap.set('n', '<leader>dh', '<cmd>DiffviewFileHistory<cr>', opts)
  vim.keymap.set('n', '<leader>dH', '<cmd>DiffviewFileHistory %<cr>', opts)
  vim.keymap.set('n', '<leader>df', '<cmd>DiffviewToggleFiles<cr>', opts)
  vim.keymap.set('n', '<leader>dr', '<cmd>DiffviewRefresh<cr>', opts)

  -- Quick diff operations
  vim.keymap.set('n', '<leader>dw', '<cmd>DiffviewOpen --imply-local<cr>', opts)
  vim.keymap.set('n', '<leader>dm', '<cmd>DiffviewOpen --merge<cr>', opts)

  -- ============================================
  -- Gitsigns Hunk Operations (with confirmation)
  -- ============================================

  -- Navigation
  vim.keymap.set('n', '<leader>gj', '<cmd>Gitsigns next_hunk<cr>', opts)
  vim.keymap.set('n', '<leader>gk', '<cmd>Gitsigns prev_hunk<cr>', opts)
  vim.keymap.set('n', ']g', '<cmd>Gitsigns next_hunk<cr>', opts)
  vim.keymap.set('n', '[g', '<cmd>Gitsigns prev_hunk<cr>', opts)
  vim.keymap.set('n', ']c', function()
    if vim.wo.diff then
      vim.cmd.normal { ']c', bang = true }
    else
      vim.cmd 'Gitsigns next_hunk'
    end
  end, { desc = 'Jump to next git [c]hange' })
  vim.keymap.set('n', '[c', function()
    if vim.wo.diff then
      vim.cmd.normal { '[c', bang = true }
    else
      vim.cmd 'Gitsigns prev_hunk'
    end
  end, { desc = 'Jump to previous git [c]hange' })

  -- Stage operations (no confirmation needed)
  vim.keymap.set('n', '<leader>gs', '<cmd>Gitsigns stage_hunk<cr>', opts)
  vim.keymap.set('n', '<leader>gS', '<cmd>Gitsigns stage_buffer<cr>', opts)
  vim.keymap.set('n', '<leader>hs', '<cmd>Gitsigns stage_hunk<cr>', opts)
  vim.keymap.set('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<cr>', opts)

  -- Visual mode stage operations
  vim.keymap.set('v', '<leader>gs', function()
    vim.cmd('Gitsigns stage_hunk ' .. vim.fn.line '.' .. ' ' .. vim.fn.line 'v')
  end, opts)
  vim.keymap.set('v', '<leader>hs', function()
    vim.cmd('Gitsigns stage_hunk ' .. vim.fn.line '.' .. ' ' .. vim.fn.line 'v')
  end, opts)

  -- Reset operations (with confirmation)
  vim.keymap.set('n', '<leader>ghr', function()
    vim.ui.input({ prompt = 'Reset hunk? [y/N]: ' }, function(input)
      if input and (input == 'y' or input == 'Y') then
        vim.cmd 'Gitsigns reset_hunk'
      end
    end)
  end, opts)

  vim.keymap.set('n', '<leader>ghR', function()
    vim.ui.input({ prompt = 'Reset ALL changes in buffer? [y/N]: ' }, function(input)
      if input and (input == 'y' or input == 'Y') then
        vim.cmd 'Gitsigns reset_buffer'
      end
    end)
  end, opts)

  vim.keymap.set('n', '<leader>gu', function()
    vim.ui.input({ prompt = 'Undo stage hunk? [y/N]: ' }, function(input)
      if input and (input == 'y' or input == 'Y') then
        vim.cmd 'Gitsigns undo_stage_hunk'
      end
    end)
  end, opts)

  -- Visual mode reset operations (with confirmation)
  vim.keymap.set('v', '<leader>gr', function()
    vim.ui.input({ prompt = 'Reset selected hunks? [y/N]: ' }, function(input)
      if input and (input == 'y' or input == 'Y') then
        vim.cmd('Gitsigns reset_hunk ' .. vim.fn.line '.' .. ' ' .. vim.fn.line 'v')
      end
    end)
  end, opts)

  vim.keymap.set('v', '<leader>hr', function()
    vim.ui.input({ prompt = 'Reset selected hunks? [y/N]: ' }, function(input)
      if input and (input == 'y' or input == 'Y') then
        vim.cmd('Gitsigns reset_hunk ' .. vim.fn.line '.' .. ' ' .. vim.fn.line 'v')
      end
    end)
  end, opts)

  -- Legacy gitsigns mappings (with confirmation)
  vim.keymap.set('n', '<leader>hr', function()
    vim.ui.input({ prompt = 'Reset hunk? [y/N]: ' }, function(input)
      if input and (input == 'y' or input == 'Y') then
        vim.cmd 'Gitsigns reset_hunk'
      end
    end)
  end, opts)

  vim.keymap.set('n', '<leader>hR', function()
    vim.ui.input({ prompt = 'Reset ALL changes in buffer? [y/N]: ' }, function(input)
      if input and (input == 'y' or input == 'Y') then
        vim.cmd 'Gitsigns reset_buffer'
      end
    end)
  end, opts)

  vim.keymap.set('n', '<leader>hu', function()
    vim.ui.input({ prompt = 'Undo stage hunk? [y/N]: ' }, function(input)
      if input and (input == 'y' or input == 'Y') then
        vim.cmd 'Gitsigns undo_stage_hunk'
      end
    end)
  end, opts)

  -- ============================================
  -- Preview and Blame Operations
  -- ============================================

  vim.keymap.set('n', '<leader>gp', '<cmd>Gitsigns preview_hunk<cr>', opts)
  vim.keymap.set('n', '<leader>gbl', '<cmd>Gitsigns blame_line<cr>', opts)
  vim.keymap.set('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<cr>', opts)
  vim.keymap.set('n', '<leader>hbl', '<cmd>Gitsigns blame_line<cr>', opts)
  vim.keymap.set('n', '<leader>hv', '<cmd>Gitsigns preview_hunk_inline<cr>', opts)

  -- ============================================
  -- Diff Operations
  -- ============================================

  vim.keymap.set('n', '<leader>gd', '<cmd>Gitsigns diffthis<cr>', opts)
  vim.keymap.set('n', '<leader>gD', '<cmd>Gitsigns diffthis @<cr>', opts)
  vim.keymap.set('n', '<leader>g~', '<cmd>Gitsigns diffthis ~<cr>', opts)
  vim.keymap.set('n', '<leader>hd', '<cmd>Gitsigns diffthis<cr>', opts)
  vim.keymap.set('n', '<leader>hD', '<cmd>Gitsigns diffthis @<cr>', opts)
  vim.keymap.set('n', '<leader>hV', '<cmd>Gitsigns diffthis ~<cr>', opts)

  -- ============================================
  -- Telescope Git Operations
  -- ============================================

  vim.keymap.set('n', '<leader>gcc', '<cmd>Telescope git_commits<cr>', opts)
  vim.keymap.set('n', '<leader>gcb', '<cmd>Telescope git_branches<cr>', opts)
  vim.keymap.set('n', '<leader>gcs', '<cmd>Telescope git_status<cr>', opts)
  vim.keymap.set('n', '<leader>gct', '<cmd>Telescope git_stash<cr>', opts)

  -- ============================================
  -- Toggle Operations
  -- ============================================

  vim.keymap.set('n', '<leader>gtb', '<cmd>Gitsigns toggle_current_line_blame<cr>', opts)
  vim.keymap.set('n', '<leader>gtd', '<cmd>Gitsigns toggle_deleted<cr>', opts)
  vim.keymap.set('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<cr>', opts)
  vim.keymap.set('n', '<leader>tD', '<cmd>Gitsigns preview_hunk_inline<cr>', opts)

  -- ============================================
  -- Advanced Operations (with confirmation)
  -- ============================================

  -- Quick diff with specific commit
  vim.keymap.set('n', '<leader>gco', function()
    vim.ui.input({ prompt = 'Diff with commit: ' }, function(commit)
      if commit and commit ~= '' then
        vim.cmd('Gitsigns diffthis ' .. commit)
      end
    end)
  end, opts)

  -- Quick revert to specific commit (dangerous)
  vim.keymap.set('n', '<leader>gcr', function()
    vim.ui.input({ prompt = 'Revert to commit: ' }, function(commit)
      if commit and commit ~= '' then
        vim.ui.input({ prompt = 'DANGEROUS: Reset buffer to commit ' .. commit .. '? [y/N]: ' }, function(confirm)
          if confirm and (confirm == 'y' or confirm == 'Y') then
            vim.cmd('Gitsigns reset_buffer ' .. commit)
          end
        end)
      end
    end)
  end, opts)

  -- Quick cherry-pick (with confirmation)
  vim.keymap.set('n', '<leader>gcp', function()
    vim.ui.input({ prompt = 'Cherry-pick commit: ' }, function(commit)
      if commit and commit ~= '' then
        vim.ui.input({ prompt = 'Cherry-pick commit ' .. commit .. '? [y/N]: ' }, function(confirm)
          if confirm and (confirm == 'y' or confirm == 'Y') then
            vim.cmd('Git cherry-pick ' .. commit)
          end
        end)
      end
    end)
  end, opts)

  -- ============================================
  -- Diffview Internal Keymaps (setup only)
  -- ============================================

  -- These will be set up when diffview opens, but we define them here for consistency
  M.setup_diffview_keymaps = function()
    -- Diffview view keymaps
    vim.keymap.set('n', '<tab>', function()
      require('diffview.actions').select_entry()
    end, { buffer = true, desc = 'Open' })
    vim.keymap.set('n', '<cr>', function()
      require('diffview.actions').select_entry()
    end, { buffer = true, desc = 'Open' })
    vim.keymap.set('n', 'q', '<cmd>DiffviewClose<cr>', { buffer = true, desc = 'Close' })
    vim.keymap.set('n', '[c', '<cmd>lua require("diffview.actions").prev_conflict()<cr>', { buffer = true, desc = 'Previous conflict' })
    vim.keymap.set('n', ']c', '<cmd>lua require("diffview.actions").next_conflict()<cr>', { buffer = true, desc = 'Next conflict' })

    -- Diffview file panel keymaps
    vim.keymap.set('n', 'j', function()
      require('diffview.actions').next_entry()
      require('diffview.actions').select_entry()
    end, { buffer = true, desc = 'Next entry and open' })
    vim.keymap.set('n', 'k', function()
      require('diffview.actions').prev_entry()
      require('diffview.actions').select_entry()
    end, { buffer = true, desc = 'Previous entry and open' })
    vim.keymap.set('n', '<cr>', '<cmd>lua require("diffview.actions").select_entry()<cr>', { buffer = true, desc = 'Open' })
    vim.keymap.set('n', 'o', '<cmd>lua require("diffview.actions").select_entry()<cr>', { buffer = true, desc = 'Open' })

    -- File-level staging operations
    vim.keymap.set('n', 's', '<cmd>lua require("diffview.actions").stage_all()<cr>', { buffer = true, desc = 'Stage all files' })
    vim.keymap.set('n', 'u', '<cmd>lua require("diffview.actions").unstage_all()<cr>', { buffer = true, desc = 'Unstage all files' })
    vim.keymap.set('n', 'S', function()
      require('diffview.actions').stage_entry()
    end, { buffer = true, desc = 'Stage current file' })
    vim.keymap.set('n', 'U', function()
      require('diffview.actions').unstage_entry()
    end, { buffer = true, desc = 'Unstage current file' })

    -- Restore entry with confirmation
    vim.keymap.set('n', 'x', function()
      vim.ui.input({ prompt = 'Restore entry (destructive)? [y/N]: ' }, function(input)
        if input and (input == 'y' or input == 'Y') then
          vim.cmd 'lua require("diffview.actions").restore_entry()'
        end
      end)
    end, { buffer = true, desc = 'Restore entry' })

    -- File history panel keymaps
    vim.keymap.set('n', 'y', '<cmd>lua require("diffview.actions").copy_hash()<cr>', { buffer = true, desc = 'Copy hash' })

    -- Hunk management keymaps (work in diff buffers)
    vim.keymap.set('n', '<leader>hs', '<cmd>Gitsigns stage_hunk<cr>', { buffer = true, desc = 'Stage hunk' })
    vim.keymap.set('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<cr>', { buffer = true, desc = 'Undo stage hunk' })
    vim.keymap.set('n', '<leader>hr', function()
      vim.ui.input({ prompt = 'Reset hunk? [y/N]: ' }, function(input)
        if input and (input == 'y' or input == 'Y') then
          vim.cmd 'Gitsigns reset_hunk'
        end
      end)
    end, { buffer = true, desc = 'Reset hunk' })
    vim.keymap.set('n', '<leader>hR', function()
      vim.ui.input({ prompt = 'Reset ALL changes in buffer? [y/N]: ' }, function(input)
        if input and (input == 'y' or input == 'Y') then
          vim.cmd 'Gitsigns reset_buffer'
        end
      end)
    end, { buffer = true, desc = 'Reset buffer' })
    vim.keymap.set('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<cr>', { buffer = true, desc = 'Preview hunk' })

    -- Visual mode hunk operations
    vim.keymap.set('v', '<leader>hs', function()
      vim.cmd('Gitsigns stage_hunk ' .. vim.fn.line '.' .. ' ' .. vim.fn.line 'v')
    end, { buffer = true, desc = 'Stage selected hunks' })
    vim.keymap.set('v', '<leader>hr', function()
      vim.ui.input({ prompt = 'Reset selected hunks? [y/N]: ' }, function(input)
        if input and (input == 'y' or input == 'Y') then
          vim.cmd('Gitsigns reset_hunk ' .. vim.fn.line '.' .. ' ' .. vim.fn.line 'v')
        end
      end)
    end, { buffer = true, desc = 'Reset selected hunks' })

    -- Quick hunk navigation in diff
    vim.keymap.set('n', ']g', '<cmd>Gitsigns next_hunk<cr>', { buffer = true, desc = 'Next hunk' })
    vim.keymap.set('n', '[g', '<cmd>Gitsigns prev_hunk<cr>', { buffer = true, desc = 'Previous hunk' })
    vim.keymap.set('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal { ']c', bang = true }
      else
        vim.cmd 'Gitsigns next_hunk'
      end
    end, { buffer = true, desc = 'Next change' })
    vim.keymap.set('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal { '[c', bang = true }
      else
        vim.cmd 'Gitsigns prev_hunk'
      end
    end, { buffer = true, desc = 'Previous change' })
  end

  -- Set up autocmd to load diffview keymaps when diffview opens
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'DiffviewFiles',
    callback = M.setup_diffview_keymaps,
  })

  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'DiffviewFileHistory',
    callback = M.setup_diffview_keymaps,
  })
end

return M
