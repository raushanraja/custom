-- Main Neovim Configuration Entry Point
-- Based on kickstart-modular.nvim essentials

-- Enable experimental Lua loader for better performance
vim.loader.enable()

-- Set leader keys early
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install lazy.nvim if not already installed
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Load core configuration modules
require 'core.options'
require 'core.keymaps'
require 'core.autocmds'

-- Load language-specific configurations
require 'languages'
require 'keymap'
require 'plugins'

-- Load additional option configurations
require 'opts.ui.theme'
