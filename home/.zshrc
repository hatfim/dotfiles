# ------------------------------------------------------------------------------

#
# ~/.zshrc
#
# ------------------------------------------------------------------------------
# Environment
# ------------------------------------------------------------------------------


# Export path to root of dotfiles repo
export DOTFILES=${DOTFILES:="$HOME/.dotfiles"}

# Load environment configuration if it exists
if [[ -f "$DOTFILES/.env" ]]; then
  set -a  # automatically export all variables
  source "$DOTFILES/.env"
  set +a  # disable automatic export
fi

# Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Do not override files using `>`, but it's still possible using `>!`
set -o noclobber

# Extend $PATH without duplicates
_extend_path() {
  [[ -d "$1" ]] || return

  if ! $( echo "$PATH" | tr ":" "\n" | grep -qx "$1" ) ; then
    export PATH="$1:$PATH"
  fi
}

# Export Brew
if [[ "$(uname -m)" == "arm64" ]]; then
  export BREW_PATH="/opt/homebrew"
fi

# Add custom bin to $PATH
_extend_path "$BREW_PATH/bin"
_extend_path "$BREW_PATH/sbin"  # Fix missing sbin in PATH
_extend_path "$HOME/.composer/vendor/bin"
_extend_path "$HOME/.local/bin"
_extend_path "$DOTFILES/bin"
_extend_path "$HOME/.npm-global/bin"
_extend_path "$HOME/.rvm/bin"
_extend_path "$HOME/.yarn/bin"
_extend_path "$HOME/.config/yarn/global/node_modules/.bin"
_extend_path "$HOME/.bun/bin"

# Extend $NODE_PATH
if [ -d ~/.npm-global ]; then
  export NODE_PATH="$NODE_PATH:$HOME/.npm-global/lib/node_modules"
fi

# bun completions
if [ -s "$HOME/.bun/_bun" ]; then
  source "$HOME/.bun/_bun"
fi

# Default pager
export PAGER='less'

# less options
less_opts=(
  # Quit if entire file fits on first screen.
  -FX
  # Ignore case in searches that do not contain uppercase.
  --ignore-case
  # Allow ANSI colour escapes, but no other escapes.
  --RAW-CONTROL-CHARS
  # Quiet the terminal bell. (when trying to scroll past the end of the buffer)
  --quiet
  # Do not complain when we are on a dumb terminal.
  --dumb
)
export LESS="${less_opts[*]}"

# Default editor for local and remote sessions
if [[ -n "$SSH_CONNECTION" ]]; then
  # on the server
  if [ command -v vim >/dev/null 2>&1 ]; then
    export EDITOR='vim'
  else
    export EDITOR='vi'
  fi
else
  export EDITOR='vim'
fi

# Better formatting for time command
export TIMEFMT=$'\n================\nCPU\t%P\nuser\t%*U\nsystem\t%*S\ntotal\t%*E'

# ------------------------------------------------------------------------------
# Oh My Zsh
# ------------------------------------------------------------------------------
ZSH_DISABLE_COMPFIX=true

# OMZ is managed by Sheldon
export ZSH="$HOME/.local/share/sheldon/repos/github.com/ohmyzsh/ohmyzsh"

plugins=(
  history-substring-search
  git
  npm
  yarn
  nvm
  sudo
  extract
  ssh-agent
  gpg-agent
  macos
  gh
  vscode
  common-aliases
  command-not-found
  docker
)

# Autoload node version when changing cwd
zstyle ':omz:plugins:nvm' autoload true

# ------------------------------------------------------------------------------
# Dependencies
# ------------------------------------------------------------------------------

# Shell plugins
eval "$(sheldon source)"
# Per-directory configs
if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

# ------------------------------------------------------------------------------
# Overrides
# ------------------------------------------------------------------------------

# Sourcing all zsh files from $DOTFILES/lib and $DOTFILES/custom
lib_files=($(find $DOTFILES/lib -type f -name "*.zsh" 2>/dev/null))
if [[ "${#lib_files[@]}" -gt 0 ]]; then
  for file in "${lib_files[@]}"; do
    source "$file"
  done
fi

custom_files=($(find $DOTFILES/custom -type f -name "*.zsh" 2>/dev/null))
if [[ "${#custom_files[@]}" -gt 0 ]]; then
  for file in "${custom_files[@]}"; do
    source "$file"
  done
fi

# Source local configuration
if [[ -f "$HOME/.zshlocal" ]]; then
  source "$HOME/.zshlocal"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Claude CLI
# if [ -f "$HOME/.claude/local/claude" ]; then
#   alias claude="$HOME/.claude/local/claude"
# fi


# ------------------------------------------------------------------------------

# Starship prompt
# https://starship.rs/
#
eval "$(starship init zsh)"
