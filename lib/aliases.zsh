#
# Aliases
#

# Enable aliases to be sudo’ed
#   http://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo
alias sudo='sudo '

_exists() {
  command -v $1 > /dev/null 2>&1
}

# Avoid stupidity with trash-cli:
# https://github.com/sindresorhus/trash-cli
# or use default rm -i
if _exists trash; then
  alias rm='trash'
fi

# Just bcoz clr shorter than clear
alias clr='clear'

# Go to the /home/$USER (~) directory and clears window of your terminal
alias q="~ && clear"

# Folders Shortcuts
[ -d ~/Downloads ]            && alias dl='cd ~/Downloads'
[ -d ~/Desktop ]              && alias dt='cd ~/Desktop'
[ -d ~/Dev ]                  && alias dev='cd ~/Dev'
[ -d ~/Dev/Forks ]            && alias dvf='cd ~/Dev/Forks'
[ -d ~/Dev/Job ]              && alias dvj='cd ~/Dev/Job'
[ -d ~/Dev/Playground ]       && alias dvp='cd ~/Dev/Playground'
[ -d ~/Dev/Repos ]            && alias dvr='cd ~/Dev/Repos'
[ -d ~/Dev/Wordpress ]        && alias dvw='cd ~/Dev/Wordpress'
[ -d ~/Dev/monit ]            && alias dvw='cd ~/Dev/monit'

# Commands Shortcuts
alias e="$EDITOR"
alias -- +x='chmod +x'
alias x+='chmod +x'

# Open aliases
alias open='open_command'
alias o='open'
alias oo='open .'
alias term='open -a iterm.app'

# Run scripts
alias update="source $DOTFILES/scripts/update"
alias bootstrap="source $DOTFILES/scripts/bootstrap"
alias validate="$DOTFILES/scripts/validate"
alias npm-globals="$DOTFILES/scripts/npm-globals"
alias create-react-project="$DOTFILES/scripts/create-react-project"
alias brew-maintenance="$DOTFILES/scripts/brew-maintenance"
alias git-commit-interactive="$DOTFILES/scripts/git-commit-interactive"
alias setup-git-hooks="$DOTFILES/scripts/setup-git-hooks"
alias export-iterm2-config="$DOTFILES/scripts/export-iterm2-config"
alias setup-iterm2="$DOTFILES/scripts/setup-iterm2"
alias setup-claude="$DOTFILES/scripts/setup-claude"

# Quick jump to dotfiles
alias dotfiles="code $DOTFILES"

# Quick reload of zsh environment
alias reload="exec zsh"

# My IP
alias myip='ifconfig | sed -En "s/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p"'

# Show $PATH in readable view
alias path='echo -e ${PATH//:/\\n}'

# Download web page with all assets
alias getpage='wget --no-clobber --page-requisites --html-extension --convert-links --no-host-directories'

# Download file with original filename
alias get="curl -O -L"

# Use tldr as help util
if _exists tldr; then
  alias help="tldr"
fi

alias git-root='cd $(git rev-parse --show-toplevel)'

if _exists lsd; then
  unalias ls
  alias ls='lsd'
  alias lt='lsd --tree'
fi

# cat with syntax highlighting
# https://github.com/sharkdp/bat
if _exists bat; then
  # Run to list all themes:
  #   bat --list-themes
  export BAT_THEME='base16'
  alias cat='bat'
fi
