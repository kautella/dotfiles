# Dotfiles

My personal dotfiles for macOS.

## What's Included

*   **Zsh** (`~/.zshrc`, `~/.p10k.zsh`): Organized Oh My Zsh configuration with Powerlevel10k theme.
*   **Neovim** (`~/.config/nvim/init.vim`): Clean configuration using `tokyonight-night` for code, `vim-airline` (with `minimalist` theme) for a sleek powerline, `vim-fugitive` for Git integration, and a transparent background.
*   **Tmux** (`~/.tmux.conf`): Configured with `tmux-power` for a taskbar that perfectly matches the Neovim powerline.
*   **Custom Scripts**: Personal bin scripts (e.g., `tmux-sessionizer`).
*   **Homebrew** (`homebrew/Brewfile`): Declarative list of all tools installed via `brew bundle`.

## Installation

On a new machine, clone the repo and run:

```bash
git clone <your-repository-url> ~/Projects/dotfiles
cd ~/Projects/dotfiles
make
```

This runs `bootstrap.sh` (installs all tools) then `install.sh` (symlinks all configs). Run them individually if needed:

```bash
make bootstrap   # install tools only (brew, OMZ, NVM, vim-plug, tpm)
make install     # symlink configs only
```

Both scripts safely backup any existing configs before overwriting.

### Manual steps after bootstrap

1. Run `p10k configure` to set up your prompt
2. Open tmux and press `prefix + I` to install plugins
3. Open nvim and run `:PlugInstall`
