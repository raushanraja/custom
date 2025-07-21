!/bin/bash

# Apply custom Neovim configuration modifications after fresh pull
# This script only modifies existing files, not creating new ones
# New files should be pulled from the repository

set -e  # Exit on any error

# Check if we're in the correct directory (Neovim config root)
if [[ ! -f "init.lua" ]] || [[ ! -d "lua" ]]; then
    echo "❌ Error: This script must be run from the Neovim configuration root directory"
    echo "   Expected files: init.lua and lua/ directory"
    echo "   Current directory: $(pwd)"
    echo "   Please navigate to your Neovim config directory first"
    exit 1
fi

# Check if required files exist
required_files=("lua/keymaps.lua" "lua/lazy-plugins.lua" "lua/options.lua")
for file in "${required_files[@]}"; do
    if [[ ! -f "$file" ]]; then
        echo "❌ Error: Required file not found: $file"
        echo "   Make sure you're in the correct Neovim configuration directory"
        exit 1
    fi
done

echo "🚀 Applying custom Neovim configuration modifications..."
echo "📁 Working directory: $(pwd)"

# 1. Modify lua/keymaps.lua - Add custom keymap require
echo "🔧 Modifying lua/keymaps.lua..."
if ! grep -q "require 'custom.keymap'" lua/keymaps.lua; then
    # Add the require line before the final comment
    sed -i '/^-- vim: ts=2 sts=2 sw=2 et$/i require '\''custom.keymap'\''' lua/keymaps.lua
    sed -i "/^\s*require\s*['\"]kickstart[\/.]plugins[\/.]/ s/^/  -- /" lua/lazy-plugins.lua

fi

# 2. Modify lua/lazy-plugins.lua - Comment out kickstart plugins and enable custom plugins
echo "🔧 Modifying lua/lazy-plugins.lua..."

# Comment out any kickstart plugin requires that are not already commented
# This handles the actual format: require 'kickstart/plugins/...'
sed -i "/^\s*require\s*['\"]kickstart\/plugins\// s/^/  -- /" lua/lazy-plugins.lua

# Enable custom plugins import if it exists and is commented out
if grep -q "^\s*--.*import.*custom\.plugins" lua/lazy-plugins.lua; then
    # If it exists but is commented out, uncomment it
    sed -i 's/^\s*--\s*{\s*import\s*=.*custom\.plugins.*$/  { import = '\''custom.plugins'\'' },/' lua/lazy-plugins.lua
fi

# 3. Modify lua/options.lua - Add custom opts require
echo "🔧 Modifying lua/options.lua..."
if ! grep -q "require 'custom.opts'" lua/options.lua; then
    # Add the require line before the final comment
    sed -i '/^-- vim: ts=2 sts=2 sw=2 et$/i require '\''custom.opts'\''' lua/options.lua
fi

echo "✅ Custom Neovim configuration modifications applied successfully!"
echo ""
echo "📋 Summary of changes:"
echo "   • Modified lua/keymaps.lua to load custom keymaps"
echo "   • Modified lua/lazy-plugins.lua to use custom plugins"
echo "   • Modified lua/options.lua to load custom options"
echo ""
echo "🎉 All custom files should be pulled from the repository!"
echo "🚀 Run 'nvim' to test your configuration!"
