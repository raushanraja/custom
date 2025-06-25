#!/bin/bash

# Apply custom Neovim configuration modifications after fresh pull
# This script only modifies existing files, not creating new ones
# New files should be pulled from the repository

set -e  # Exit on any error

echo "🚀 Applying custom Neovim configuration modifications..."

# 1. Modify lua/keymaps.lua - Add custom keymap require
echo "🔧 Modifying lua/keymaps.lua..."
if ! grep -q "require 'custom.keymap'" lua/keymaps.lua; then
    # Add the require line before the final comment
    sed -i '/^-- vim: ts=2 sts=2 sw=2 et$/i require '\''custom.keymap'\''' lua/keymaps.lua
fi

# 2. Modify lua/lazy-plugins.lua - Comment out kickstart plugins and enable custom plugins
echo "🔧 Modifying lua/lazy-plugins.lua..."

# Comment out any kickstart plugin requires that are not already commented
# This handles various indentations and will work regardless of order
sed -i '/^\s*require.*kickstart\.plugins\./ {
  /^\s*--/!s/^/  --/
}' lua/lazy-plugins.lua

# Enable custom plugins import if it exists and is commented out
# First, check if the line exists at all
if grep -q "import.*custom\.plugins" lua/lazy-plugins.lua; then
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
