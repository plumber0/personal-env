#!/usr/bin/env bash

set -euo pipefail

if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew is required to install LazyVim dependencies."
    exit 1
fi

brew install neovim ripgrep fd fzf lazygit tree-sitter-cli
