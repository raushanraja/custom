-- Language-specific Configurations
-- This module loads language-specific settings and keymaps

local M = {}

-- Load language-specific keymaps
require 'keymap.lang.python'
require 'keymap.lang.js'
require 'keymap.lang.rust'

-- Language server configurations
local lsp_servers = {
  'pyright', -- Python
  'ts_ls', -- TypeScript/JavaScript
  'rust_analyzer', -- Rust
  'lua_ls', -- Lua
  'gopls', -- Go
  'clangd', -- C/C++
}

-- File type associations
local filetypes = {
  python = { 'python', 'py' },
  javascript = { 'javascript', 'js', 'typescript', 'ts' },
  rust = { 'rust', 'rs' },
  lua = { 'lua' },
  go = { 'go' },
  cpp = { 'c', 'cpp', 'h', 'hpp' },
}

-- Export for use in other modules
M.lsp_servers = lsp_servers
M.filetypes = filetypes

return M
