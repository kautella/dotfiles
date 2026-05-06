#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "==> Installing Homebrew packages..."
brew bundle --file="$DOTFILES_DIR/homebrew/Brewfile"

echo "==> Installing Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Oh My Zsh already installed, skipping."
fi

echo "==> Installing NVM..."
if [ ! -d "$HOME/.nvm" ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
else
    echo "NVM already installed, skipping."
fi

echo "==> Installing vim-plug for neovim..."
if [ ! -f "$HOME/.local/share/nvim/site/autoload/plug.vim" ]; then
    curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
    echo "vim-plug already installed, skipping."
fi

echo "==> Installing tpm (tmux plugin manager)..."
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
else
    echo "tpm already installed, skipping."
fi

echo "==> Creating tmux-sessionizer config..."
TS_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/tmux-sessionizer"
TS_CONFIG_FILE="$TS_CONFIG_DIR/tmux-sessionizer.conf"
if [ ! -f "$TS_CONFIG_FILE" ]; then
    mkdir -p "$TS_CONFIG_DIR"
    cat > "$TS_CONFIG_FILE" <<'EOF'
# tmux-sessionizer configuration
# Directories to search for sessions (overrides default)
# TS_SEARCH_PATHS=(~/Projects ~/)

# Additional search paths with optional depth (appended to TS_SEARCH_PATHS)
# TS_EXTRA_SEARCH_PATHS=(~/work:2 ~/personal:2)

# Max depth for directory search (default: 1)
# TS_MAX_DEPTH=2
EOF
    echo "Created $TS_CONFIG_FILE — edit it to configure your search paths."
else
    echo "tmux-sessionizer config already exists, skipping."
fi

echo ""
echo "Bootstrap complete! Manual steps remaining:"
echo "  1. Run 'p10k configure' to set up your prompt"
echo "  2. Open tmux and press prefix + I to install plugins"
echo "  3. Open nvim and run :PlugInstall"
echo "  4. Edit ~/.config/tmux-sessionizer/tmux-sessionizer.conf to set your project search paths"
echo ""
