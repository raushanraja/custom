# Git & Diff Workflow Guide

This guide details the comprehensive git and diff management system configured in Neovim, providing efficient workflows for viewing, managing, and manipulating git changes.

## Overview

The configuration integrates **Diffview.nvim**, **Gitsigns**, and **Telescope** to provide a unified git workflow with the following key features:

- **Streamlined diff navigation** with automatic file opening
- **Comprehensive hunk management** for precise change control
- **Safety confirmations** for destructive operations
- **Visual mode support** for selective operations
- **Quick access** to common git operations

## Quick Reference

### Main Commands
| Keymap | Description | Context |
|--------|-------------|---------|
| `<leader>do` | Open Diffview | Global |
| `<leader>dc` | Close Diffview | Global |
| `<leader>dh` | File history | Global |
| `<leader>dH` | Current file history | Global |
| `<leader>df` | Toggle files panel | Global |
| `<leader>dr` | Refresh Diffview | Global |
| `<leader>dw` | Open with local changes | Global |
| `<leader>dm` | Open in merge mode | Global |

---

## Diffview File Panel Navigation

The file panel provides streamlined navigation where `j` and `k` automatically open files as you navigate.

### Navigation Keys
| Keymap | Description |
|--------|-------------|
| `j` | Next entry AND open it automatically |
| `k` | Previous entry AND open it automatically |
| `<cr>` | Manual open (alternative) |
| `o` | Manual open (alternative) |

### File Management
| Keymap | Description |
|--------|-------------|
| `s` | Stage all files |
| `u` | Unstage all files |
| `S` | Stage current file only |
| `U` | Unstage current file only |
| `x` | Restore entry (destructive, requires confirmation) |

### Workflow Example
1. Open Diffview: `<leader>do`
2. Navigate through files using `j`/`k` - files open automatically
3. Use `S` to stage specific files or `s` to stage all
4. Use `x` to restore files (with confirmation)

---

## Hunk Management in Diff Buffers

When viewing actual diffs, you have precise control over individual hunks (changes).

### Hunk Operations
| Keymap | Description | Confirmation |
|--------|-------------|-------------|
| `<leader>hs` | Stage current hunk | No |
| `<leader>hu` | Undo stage hunk | No |
| `<leader>hr` | Reset hunk (discard changes) | Yes |
| `<leader>hR` | Reset entire buffer | Yes |
| `<leader>hp` | Preview hunk | No |

### Visual Mode Operations
Select lines in visual mode first, then use:

| Keymap | Description | Confirmation |
|--------|-------------|-------------|
| `<leader>hs` | Stage selected hunks | No |
| `<leader>hr` | Reset selected hunks | Yes |

### Hunk Navigation
| Keymap | Description |
|--------|-------------|
| `]g` | Jump to next hunk |
| `[g` | Jump to previous hunk |
| `]c` | Jump to next change |
| `[c` | Jump to previous change |

### Workflow Example
1. Open a file diff in Diffview
2. Navigate to a hunk using `]g`/`[g`
3. Stage good changes: `<leader>hs`
4. Reset bad changes: `<leader>hr` (confirms)
5. For partial changes: select lines in visual mode, then `<leader>hs`

---

## Global Git Operations

### Gitsigns Integration
| Keymap | Description | Confirmation |
|--------|-------------|-------------|
| `<leader>gs` | Stage hunk | No |
| `<leader>gS` | Stage buffer | No |
| `<leader>gr` | Reset hunk | Yes |
| `<leader>gR` | Reset buffer | Yes |
| `<leader>gu` | Undo stage hunk | Yes |
| `<leader>gp` | Preview hunk | No |
| `<leader>gbl` | Blame line | No |
| `<leader>gd` | Diff this | No |
| `<leader>gD` | Diff that (against HEAD) | No |

### Telescope Git Integration
| Keymap | Description |
|--------|-------------|
| `<leader>gcc` | Browse commits |
| `<leader>gcb` | Browse branches |
| `<leader>gcs` | Git status |
| `<leader>gct` | Git stash |

### Toggle Operations
| Keymap | Description |
|--------|-------------|
| `<leader>gtb` | Toggle current line blame |
| `<leader>gtd` | Toggle deleted display |

---

## Advanced Operations

### Quick Diff with Commit
| Keymap | Description |
|--------|-------------|
| `<leader>gco` | Diff with specific commit (prompts for commit hash) |

### Dangerous Operations (Double Confirmation)
| Keymap | Description |
|--------|-------------|
| `<leader>gcr` | Revert buffer to specific commit |
| `<leader>gcp` | Cherry-pick specific commit |

---

## Safety Features

### Confirmation System
All destructive operations require explicit confirmation:

- **Reset operations**: `Reset hunk? [y/N]:`
- **Buffer reset**: `Reset ALL changes in buffer? [y/N]:`
- **File restore**: `Restore entry (destructive)? [y/N]:`
- **Dangerous operations**: `DANGEROUS: Reset buffer to commit XYZ? [y/N]:`

### Double Confirmation for Critical Operations
- Cherry-pick and revert operations require two confirmations:
  1. Enter commit hash
  2. Confirm the action

---

## Common Workflows

### 1. Review and Stage Changes
```bash
# Open Diffview
<leader>do

# Navigate through files
j (next file, auto-opens)
k (previous file, auto-opens)

# Stage good changes
<leader>hs (stage hunk)
S (stage current file)

# Reset bad changes
<leader>hr (reset hunk, confirms)
```

### 2. Selective Hunk Management
```bash
# Open file diff
<leader>do → select file

# Navigate to specific hunk
]g (next hunk)
[g (previous hunk)

# Select specific lines in visual mode
V → select lines → <leader>hs (stage selected)
```

### 3. File History Review
```bash
# View file history
<leader>dH (current file)
<leader>dh (all files)

# Navigate history
j/k (auto-opens commits)
y (copy commit hash)
```

### 4. Quick Git Operations
```bash
# Quick status check
<leader>gcs (Telescope git status)

# Browse commits
<leader>gcc (Telescope git commits)

# Quick blame
<leader>gbl (blame current line)
```

---

## Configuration Files

### Primary Configuration
- **`lua/keymap/core/git.lua`** - Main git and diff keymaps
- **`lua/plugins/ui/gitsigns.lua`** - Gitsigns plugin configuration
- **`lua/plugins/ui/diffview.lua`** - Diffview plugin configuration

### Integration Points
- **`lua/keymap/init.lua`** - Loads git keymaps
- **`lua/keymap/utils/snacks.lua`** - Additional git utilities

---

## Troubleshooting

### Common Issues

1. **Keymaps not working**: Ensure git keymaps are loaded with `require('keymap.core.git').setup()`
2. **Diffview not opening**: Check if git repository is initialized
3. **Hunk operations failing**: Verify file is tracked by git
4. **Confirmation dialogs not appearing**: Check if `vim.ui.input` is properly configured

### Conflicts with Other Plugins
The configuration avoids conflicts with:
- **Snacks plugin**: Uses different keymaps (`<leader>gg`, `<leader>gb`, etc.)
- **Comment plugin**: No overlap with git operations
- **LSP keymaps**: No overlap with git operations

---

## Tips and Best Practices

### Efficiency Tips
1. **Use `j`/`k` in Diffview** for fastest navigation
2. **Stage early and often** to avoid losing work
3. **Use visual mode** for precise hunk selection
4. **Leverage Telescope** for quick git status checks

### Safety Practices
1. **Always review confirmation prompts** before destructive operations
2. **Commit frequently** to have good restore points
3. **Use file history** to understand change context
4. **Test complex operations** on non-critical files first

### Workflow Optimization
1. **Customize keymaps** in `lua/keymap/core/git.lua` if needed
2. **Add aliases** for frequently used operations
3. **Use toggle operations** for temporary views
4. **Leverage preview** features before making changes

---

## Conclusion

This git and diff workflow system provides a comprehensive, safe, and efficient way to manage git changes in Neovim. The integration of Diffview, Gitsigns, and Telescope creates a unified experience that streamlines common git operations while maintaining safety through confirmation dialogs.

The key design principles are:
- **Efficiency**: Minimize steps for common operations
- **Safety**: Confirm destructive actions
- **Flexibility**: Support both file-level and hunk-level operations
- **Integration**: Work seamlessly with existing Neovim ecosystem

For questions or customization needs, refer to the configuration files in `lua/keymap/core/git.lua` and `lua/plugins/ui/`.
