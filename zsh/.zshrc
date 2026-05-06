# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ==============================================================================
# Environment Variables & PATH
# ==============================================================================

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Base PATH
export PATH="$HOME/.bin:$HOME/.local/bin:/usr/local/bin:$PATH"

# JetBrains Toolbox App
export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"

# TFenv
export PATH="$HOME/.tfenv/bin:$PATH"

# Krew (Kubernetes plugin manager)
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Google Cloud SDK
if [ -f "$HOME/Builds/google-cloud-sdk/path.zsh.inc" ]; then
  source "$HOME/Builds/google-cloud-sdk/path.zsh.inc"
fi

# ==============================================================================
# Oh My Zsh Configuration
# ==============================================================================

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
plugins=(git)

source $ZSH/oh-my-zsh.sh

# ==============================================================================
# Tool Initializations
# ==============================================================================

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Google Cloud SDK Completion
if [ -f "$HOME/Builds/google-cloud-sdk/completion.zsh.inc" ]; then
  source "$HOME/Builds/google-cloud-sdk/completion.zsh.inc"
fi

# ==============================================================================
# Aliases
# ==============================================================================

alias ts="tmux-sessionizer"
alias k="kubectl"
alias ga="git add"
alias gc="git commit"

# Alias vim to neovim
alias vim="nvim"

# ==============================================================================
# Prompts & Themes
# ==============================================================================

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
