# Custom Neovim Configuration

## 📁 Project Structure

```
├── init.lua            # Main orchestration file (lazy setup + custom loader)
├── lua/                  # Lua configuration root
│   ├── core/               # Core Neovim settings
│   │   ├── options.lua     # Basic options
│   │   ├── keymaps.lua     # Core key mappings
│   │   └── autocmds.lua    # Automatic commands
│   ├── plugins/            # Plugin configurations (categorized)
│   │   ├── core/           # Essential plugins
│   │   ├── ui/             # Interface plugins
│   │   ├── dev/            # Development tools
│   │   ├── ai/             # AI/ML plugins
│   │   ├── utils/          # Utility plugins
│   │   └── init.lua        # Main plugin loader
│   ├── keymap/             # Key mapping configurations
│   ├── opts/               # Options (categorized)
│   ├── languages/          # Language-specific settings
└── dockerfile          # Streamlined Docker setup
```

## 🛠️ Installation

### Docker Installation (Recommended)

1. **Build and run:**
   ```bash
   cd /path/to/custom
   docker-compose up --build nvim-dev
   ```

2. **Test the setup:**
   ```bash
   docker-compose --profile test up nvim-test
   ```

3. **Access the container:**
   ```bash
   docker exec -it custom-nvim-dev bash
   nvim
   ```

### Manual Installation

1. **Clone your custom config:**
   ```bash
   git clone https://github.com/raushanraja/custom ~/.config/nvim/lua/custom
   ```

2. **Create basic init.lua:**
   ```lua
   -- ~/.config/nvim/init.lua
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
   ```

3. **Start Neovim:**
   ```bash
   nvim
   ```

## 🚀 Quick Start

1. **Build the image:**
   ```bash
   docker-compose build
   ```

2. **Run development environment:**
   ```bash
   docker-compose up nvim-dev
   ```

3. **Start coding:**
   ```bash
   nvim your-file.lua
   ```

## ⚙️ Configuration

## 🔧 Customization

### Adding Custom Plugins

1. Create a new plugin file in the appropriate category:
   ```lua
   -- custom/plugins/ui/my-plugin.lua
   return {
     {
       'author/my-plugin',
       config = function()
         -- Plugin configuration
       end,
     },
   }
   ```

2. Add it to the main plugins init.lua:
   ```lua
   require('custom.plugins.ui.my-plugin')
   ```

### Custom Keymaps

Add custom keymaps to `custom/keymap/init.lua`:
```lua
vim.keymap.set('n', '<leader>y', '"+y', { desc = 'Yank to system clipboard' })
```

### User-specific Configuration

Create `custom/user.lua` for personal customizations:
```lua
-- custom/user.lua
vim.opt.spell = true
vim.opt.spelllang = 'en_us'

-- Add personal keymaps
vim.keymap.set('n', '<leader>p', ':PackerSync<CR>', { desc = 'Sync plugins' })
```

## 🐳 Docker Usage

### Development Environment
```bash
# Start development container
docker-compose up nvim-dev

# Access the container
docker exec -it custom-nvim-dev bash
```

### Testing
```bash
# Quick test
docker-compose --profile test up nvim-test

# Manual test
docker run --rm -it custom-nvim-streamlined
```

### Building Custom Image
```bash
# Build streamlined image
docker build -t custom-nvim-streamlined -f dockerfile .

# Run the container
docker run --rm -it custom-nvim-streamlined
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test with Docker
5. Submit a pull request

## 🙏 Acknowledgments

- [kickstart-modular.nvim](https://github.com/dam9000/kickstart-modular.nvim) - Essential lazy setup inspiration
- [Lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin management
- [Neovim](https://neovim.io/) - The text editor

---

**Happy coding!** 🎉
