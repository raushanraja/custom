-- Core Neovim Options Configuration
-- This module sets up the basic Neovim options

local M = {}

-- Basic options
local options = {
  -- File handling
  swapfile = false,
  backup = false,
  writebackup = false,
  undofile = true,
  undolevels = 1000,

  -- UI
  number = true,
  relativenumber = true,
  cursorline = true,
  cursorcolumn = false,
  signcolumn = 'yes',
  showmode = false,
  showcmd = true,
  cmdheight = 1,
  laststatus = 3, -- Global statusline

  -- Search
  ignorecase = true,
  smartcase = true,
  hlsearch = true,
  incsearch = true,

  -- Indentation
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  softtabstop = 2,
  smartindent = true,
  autoindent = true,

  -- Wrapping
  wrap = false,
  linebreak = true,
  breakindent = true,

  -- Performance
  updatetime = 300,
  timeoutlen = 500,
  redrawtime = 1500,

  -- Mouse
  mouse = 'a',

  -- Clipboard
  clipboard = 'unnamedplus',

  -- Completion
  completeopt = 'menuone,noselect',

  -- Folding
  foldmethod = 'expr',
  foldexpr = 'nvim_treesitter#foldexpr()',
  foldlevel = 99,
  foldlevelstart = 99,

  -- Scrolling
  scrolloff = 8,
  sidescrolloff = 8,

  -- Splits
  splitright = true,
  splitbelow = true,

  -- History
  history = 1000,

  -- Wild menu
  wildmenu = true,
  wildmode = 'longest:full,full',

  -- Bell
  belloff = 'all',

  -- Encoding
  encoding = 'utf-8',
  fileencoding = 'utf-8',

  -- Term GUI colors
  termguicolors = true,
}

-- Apply options
for option, value in pairs(options) do
  vim.opt[option] = value
end

-- Global variables
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.have_nerd_font = true

-----------------------------------------------------------
-- [[ Setting colorscheme and other commands ]]
-----------------------------------------------------------
local cmd = {
  colorscheme = 'one_monokai',
}
-- Apply commands
for command, value in pairs(cmd) do
  -- Using pcall to safely set commands, as some might not be available immediately
  pcall(vim.cmd.set, command .. '=' .. value)
end
-----------------------------------------------------------
-- [[ end ]]
-----------------------------------------------------------

return M
