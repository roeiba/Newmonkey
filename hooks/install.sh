#!/bin/bash
# Install git hooks by creating symlinks

HOOKS_DIR="$(cd "$(dirname "$0")" && pwd)"
GIT_HOOKS_DIR="$(dirname "$HOOKS_DIR")/.git/hooks"

for hook in "$HOOKS_DIR"/*; do
    hook_name=$(basename "$hook")
    [ "$hook_name" = "install.sh" ] && continue
    
    ln -sf "../../hooks/$hook_name" "$GIT_HOOKS_DIR/$hook_name"
    echo "✅ Installed $hook_name"
done

echo "🎉 Git hooks installed!"
