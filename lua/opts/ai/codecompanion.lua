-- ============================================================================
-- CodeCompanion Configuration & Options
-- ============================================================================
-- Comprehensive configuration for CodeCompanion AI assistant
-- Organized into logical blocks for easy understanding and modification

local M = {}

-- ============================================================================
-- 1. CORE STRATEGIES CONFIGURATION
-- ============================================================================
-- Define which AI adapter to use for different interaction modes
local strategies = {
  -- Chat interface for conversations with AI
  chat = {
    adapter = 'copilot',
  },
  -- Inline suggestions and code generation
  inline = {
    adapter = 'copilot',
  },
  -- AI agent for automated tasks
  agent = {
    adapter = 'copilot',
  },
}

-- ============================================================================
-- 2. AI ADAPTERS CONFIGURATION
-- ============================================================================
-- Configure the AI providers and their specific settings
local adapters = {
  -- GitHub Copilot adapter configuration
  http = {
    copilot = function()
      return require('codecompanion.adapters').extend('copilot', {
        schema = {
          model = {
            default = 'gpt-4.1', -- High-quality model for best results
          },
        },
      })
    end,
  },
}

-- ============================================================================
-- 3. GENERAL OPTIONS
-- ============================================================================
-- Global settings that affect plugin behavior
local opts = {
  log_level = 'ERROR', -- Only show error messages (INFO, WARN, ERROR, DEBUG)
  send_code = true, -- Allow sending code context to AI
  silence_notifications = false, -- Show notifications for operations
}

-- ============================================================================
-- 4. USER INTERFACE CONFIGURATION
-- ============================================================================
-- Customize the appearance and behavior of CodeCompanion UI elements

-- Action Palette Settings (command menu)
local action_palette = {
  width = 95, -- Width of the action palette window
  height = 10, -- Height of the action palette window
}

-- Chat Window Configuration
local chat_window = {
  -- Window layout and positioning
  layout = 'vertical', -- Options: 'float', 'vertical', 'horizontal', 'buffer'
  border = 'single', -- Border style: 'single', 'double', 'rounded', 'none'
  height = 0.8, -- 80% of editor height
  width = 0.45, -- 45% of editor width
  relative = 'editor', -- Position relative to editor

  -- Window-specific options for better text display
  opts = {
    breakindent = true, -- Maintain indentation on wrapped lines
    cursorcolumn = false, -- Don't highlight cursor column
    cursorline = false, -- Don't highlight cursor line
    foldcolumn = '0', -- No fold column
    linebreak = true, -- Break lines at word boundaries
    list = false, -- Don't show whitespace characters
    signcolumn = 'no', -- No sign column
    spell = false, -- Disable spell checking
    wrap = true, -- Enable line wrapping
  },
}

-- Chat Behavior Settings
local chat_behavior = {
  intro_message = 'Welcome to CodeCompanion ✨', -- Greeting message
  separator = '─', -- Message separator character
  show_token_count = true, -- Display token usage
  show_header_separator = true, -- Show header dividers
  start_in_insert_mode = false, -- Start in normal mode
  use_default_actions = true, -- Enable default actions
  use_default_tools = true, -- Enable default tools
}

-- Diff View Configuration
local diff_display = {
  layout = 'vertical', -- Options: 'vertical', 'horizontal'
  opts = {
    wrap = false, -- Don't wrap long lines in diff view
  },
  provider = 'inline', -- Options: 'inline', 'split', 'mini_diff'
}

-- Inline Assistant Configuration
local inline_display = {
  layout = 'vertical', -- How to display new buffers: 'vertical', 'horizontal', 'buffer'
}

-- ============================================================================
-- 5. PROMPT LIBRARY CONFIGURATION
-- ============================================================================
-- Pre-defined prompts for common coding tasks

local prompt_library = {
  -- Custom interactive prompt
  ['Custom Prompt'] = {
    strategy = 'inline',
    description = 'Create a custom prompt',
    opts = {
      placement = 'cursor', -- Place result at cursor position
    },
    prompts = {
      {
        role = 'user',
        content = function()
          return vim.fn.input 'Custom prompt: '
        end,
      },
    },
  },

  -- Code explanation prompt
  ['Explain Code'] = {
    strategy = 'chat',
    description = 'Explain how the selected code works',
    opts = {
      modes = { 'v' }, -- Only available in visual mode
      short_name = 'explain', -- Short name for quick access
      auto_submit = true, -- Submit automatically
      user_prompt = false, -- Don't prompt user for input
      stop_context_insertion = true, -- Don't add extra context
    },
    prompts = {
      {
        role = 'system',
        content = 'You are an expert programmer. Explain code clearly and concisely.',
      },
      {
        role = 'user',
        content = function(context)
          return 'Please explain how this code works:\n\n```' .. context.filetype .. '\n' .. context.selection .. '\n```'
        end,
      },
    },
  },

  -- Unit test generation prompt
  ['Generate Tests'] = {
    strategy = 'chat',
    description = 'Generate unit tests for the selected code',
    opts = {
      modes = { 'v' },
      short_name = 'tests',
      auto_submit = true,
      user_prompt = false,
      stop_context_insertion = true,
    },
    prompts = {
      {
        role = 'system',
        content = 'You are an expert at writing comprehensive unit tests. Generate thorough, well-structured tests.',
      },
      {
        role = 'user',
        content = function(context)
          return 'Please generate comprehensive unit tests for this code:\n\n```'
            .. context.filetype
            .. '\n'
            .. context.selection
            .. '\n```\n\nInclude edge cases and proper test structure.'
        end,
      },
    },
  },

  -- Code optimization prompt
  ['Optimize Code'] = {
    strategy = 'inline',
    description = 'Optimize the selected code for performance',
    opts = {
      modes = { 'v' },
      short_name = 'optimize',
      auto_submit = true,
      user_prompt = false,
      stop_context_insertion = true,
    },
    prompts = {
      {
        role = 'system',
        content = 'You are an expert programmer focused on code optimization. Improve code for better performance, readability, and maintainability.',
      },
      {
        role = 'user',
        content = function(context)
          return 'Please optimize this code for better performance and readability:\n\n```'
            .. context.filetype
            .. '\n'
            .. context.selection
            .. '\n```\n\nReturn only the optimized code without explanations.'
        end,
      },
    },
  },

  -- Bug fixing prompt
  ['Fix Code'] = {
    strategy = 'inline',
    description = 'Fix bugs or issues in the selected code',
    opts = {
      modes = { 'v' },
      short_name = 'fix',
      auto_submit = true,
      user_prompt = false,
      stop_context_insertion = true,
    },
    prompts = {
      {
        role = 'system',
        content = 'You are an expert debugger. Fix bugs and issues in code while maintaining functionality.',
      },
      {
        role = 'user',
        content = function(context)
          return 'Please fix any bugs or issues in this code:\n\n```'
            .. context.filetype
            .. '\n'
            .. context.selection
            .. '\n```\n\nReturn only the fixed code without explanations.'
        end,
      },
    },
  },

  -- Code documentation prompt
  ['Add Comments'] = {
    strategy = 'inline',
    description = 'Add comprehensive comments to the selected code',
    opts = {
      modes = { 'v' },
      short_name = 'comment',
      auto_submit = true,
      user_prompt = false,
      stop_context_insertion = true,
    },
    prompts = {
      {
        role = 'system',
        content = 'You are an expert at code documentation. Add clear, comprehensive comments to code.',
      },
      {
        role = 'user',
        content = function(context)
          return 'Please add comprehensive comments to this code explaining what each part does:\n\n```'
            .. context.filetype
            .. '\n'
            .. context.selection
            .. '\n```\n\nReturn the code with comments added.'
        end,
      },
    },
  },

  -- Commit message generation prompt
  ['Generate a Commit Message'] = {
    strategy = 'chat',
    description = 'Generate a commit message',
    opts = {
      index = 10,
      is_default = true,
      is_slash_cmd = true,
      short_name = 'commit',
      auto_submit = true,
    },
    prompts = {
      {
        role = 'user',
        content = function()
          return string.format(
            [[You are an expert at following the Conventional Commit specification. Given the git diff listed below, please generate a commit message for me based on the changes and given rules.

Rules:
- Use conventional commit format: type(scope): description
- Types: feat, fix, refactor, test, docs, chore, style
- Scope should be the entity or feature area
- Should have a short, descriptive title
- Should include point-form short details
- All commit messages should be inside a diff code block

#DIFF_START#
```diff
%s
```
#DIFF_END
]],
            vim.fn.system 'git diff --no-ext-diff --staged'
          )
        end,
        opts = {
          contains_code = true,
        },
      },
    },
  },
}

-- ============================================================================
-- 6. VIM OPTIONS FOR CODECOMPANION
-- ============================================================================
-- Enhanced vim options for better CodeCompanion experience

-- Better completion options for AI suggestions
vim.opt.completeopt = { 'menu', 'menuone', 'noselect', 'preview' }

-- Enhanced diff options for better code comparison
vim.opt.diffopt:append 'linematch:60'
vim.opt.diffopt:append 'algorithm:patience'
vim.opt.diffopt:append 'indent-heuristic'

-- ============================================================================
-- 7. AUTOCOMMANDS FOR CODECOMPANION BUFFERS
-- ============================================================================
-- Automatic settings for CodeCompanion-specific buffers

local codecompanion_group = vim.api.nvim_create_augroup('CodeCompanionConfig', { clear = true })

-- Optimize settings for CodeCompanion chat buffers
vim.api.nvim_create_autocmd('FileType', {
  group = codecompanion_group,
  pattern = 'codecompanion',
  callback = function()
    -- Text formatting optimizations
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.breakindent = true
    vim.opt_local.showbreak = '↳ '
    vim.opt_local.textwidth = 80
    vim.opt_local.conceallevel = 2
    vim.opt_local.concealcursor = 'nc'

    -- Clean interface for chat
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = 'no'
    vim.opt_local.foldcolumn = '0'
    vim.opt_local.colorcolumn = ''

    -- Better visual feedback
    vim.opt_local.cursorline = true
    vim.opt_local.cursorcolumn = false
  end,
})

-- ============================================================================
-- 8. GLOBAL CODECOMPANION SETTINGS
-- ============================================================================
-- Global vim variables for CodeCompanion customization

vim.g.codecompanion = {
  disable_default_keymaps = false, -- Keep default keymaps alongside custom ones
  default_adapter = 'copilot', -- Use GitHub Copilot as primary adapter
  auto_save_chats = true, -- Automatically save chat sessions
  show_progress = true, -- Show progress notifications
}

-- ============================================================================
-- 9. EXPORT CONFIGURATION
-- ============================================================================
-- Combine all configuration blocks into final setup

M.config = {
  strategies = strategies,
  adapters = adapters,
  opts = opts,
  display = {
    action_palette = action_palette,
    chat = vim.tbl_extend('force', chat_window, chat_behavior),
    diff = diff_display,
    inline = inline_display,
  },
  prompt_library = prompt_library,
}

return M
