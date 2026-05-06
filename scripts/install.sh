#!/bin/bash

# Get the directory where this script is located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "Setting up dotfiles..."

# Function to create a symlink safely
create_symlink() {
    local source_file="$1"
    local target_file="$2"

    if [ -L "$target_file" ]; then
        if [ "$(readlink "$target_file")" != "$source_file" ]; then
            echo "Updating symlink: $target_file -> $source_file"
            ln -sf "$source_file" "$target_file"
        else
            echo "Symlink already correct: $target_file"
        fi
    elif [ -e "$target_file" ]; then
        echo "File already exists, backing up: $target_file -> $target_file.backup"
        mv "$target_file" "$target_file.backup"
        ln -s "$source_file" "$target_file"
        echo "Created symlink: $target_file -> $source_file"
    else
        ln -s "$source_file" "$target_file"
        echo "Created symlink: $target_file -> $source_file"
    fi
}

echo "Linking tmux configuration..."
create_symlink "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"

echo "Linking neovim configuration..."
mkdir -p "$HOME/.config/nvim"
create_symlink "$DOTFILES_DIR/nvim/init.vim" "$HOME/.config/nvim/init.vim"

echo "Linking zsh configuration..."
create_symlink "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
create_symlink "$DOTFILES_DIR/zsh/.p10k.zsh" "$HOME/.p10k.zsh"

echo "Linking bin scripts..."
mkdir -p "$HOME/.bin"
create_symlink "$DOTFILES_DIR/bin/tmux-sessionizer" "$HOME/.bin/tmux-sessionizer"
xattr -d com.apple.quarantine "$DOTFILES_DIR/bin/tmux-sessionizer" 2>/dev/null || true

echo "Dotfiles setup complete!"
