#
# Aliases
#
# Refresh zshrc
alias rzshrc= 'source ~/.zshrc'

# Enable aliases to be sudo’ed
#   http://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo
alias sudo='sudo '

# Avoid stupidity with trash-cli:
# 	https://github.com/sindresorhus/trash-cli
# or use default rm -i
if type trash &>/dev/null; then
	alias rm='trash'
else
	alias rm='rm -i'
fi

# Just bcoz clr shorter than clear
alias clr='clear'

# Go to the /home/$USER (~) directory and clears window of your terminal
alias q="~ && clear"

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Folders Shortcuts
[ -d ~/Dropbox ]              && alias dr='cd ~/Dropbox'
[ -d ~/Desktop ]              && alias dt='cd ~/Desktop'
[ -d ~/Downloads ]            && alias dl='cd ~/Downloads'
[ -d ~/Localsites ]           && alias dev='cd ~/Localsites'
[ -d ~/Projects ]             && alias proj='cd ~/Projects'
[ -d ~/Projects/Repos ]       && alias repo='cd ~/Projects/Repos'
[ -d ~/Projects/Clones ]      && alias clone='cd ~/Projects/Clones'
# [ -d ~/Projects/Forks ]       && alias pjf='cd ~/Projects/Forks'
# [ -d ~/Projects/_Forks ]      && alias pjf='cd ~/Projects/_Forks'
[ -d ~/Projects/Playground ]  && alias play='cd ~/Projects/Playground'
# [ -d ~/Projects/_Playground ] && alias pl='cd ~/Projects/_Playground'
# [ -d ~/Projects/Job ]         && alias pjj='cd ~/Projects/Job'
# [ -d ~/Projects/_Job ]        && alias pjj='cd ~/Projects/_Job'

# Edit Shortcuts
alias edot='subl ~/Dotfiles'
alias evhost='subl ~/Localsites/httpd-vhosts.conf'
alias ehttpd='subl $(brew --prefix)/etc/apache2/2.4'
alias ephp='subl $(brew --prefix)/etc/php/5.6'

# Command Server Shortcust
alias rhttpd= 'brew services restart httpd24'
alias rphp= 'brew services restart php56'
alias rmyql= 'brew services restart mysql'

# Commands Shortcuts
alias e="$EDITOR"
alias -- +x='chmod +x'
alias x+='chmod +x'

# Open aliases
alias open='open_command'
alias o='open'
alias oo='open .'

# Some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Clipboard tools
if [ command -v xclip >/dev/null 2>&1 ]; then
	alias xcopy='xclip -selection clipboard'
	alias xpaste='xclip -selection clipboard -o'
fi

# Color conversion
alias hex2hsl='color.js $1 $2'
alias hex2rgb='color.js --rgb $1 $2'

# Add an "alert" alias for long running commands.
# Use like so:
#   sleep 10; alert
if [ command -v notify-send >/dev/null 2>&1 ]; then
	alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
fi

# My IP
alias myip='curl -s https://4.ifcfg.me/'
alias mylocalip='ifconfig | sed -En "s/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p"'

# Password generator
# Gemnerate random password, copies it into clipboard and outputs it to terminal
if [ command -v pbcopy >/dev/null 2>&1 ]; then
	alias password='openssl rand -base64 ${1:-9} | pbcopy ; echo "$(pbpaste)"'
fi
if [ command -v xcopy >/dev/null 2>&1 ]; then
	alias password='openssl rand -base64 ${1:-9} | xcopy ; echo "$(xpaste)"'
fi

# Show $PATH in readable view
alias path='echo -e ${PATH//:/\\n}'

# Git root
# Change directory to root of git repository
alias gr='git rev-parse 2>/dev/null && cd "./$(git rev-parse --show-cdup)"'

# Download web page with all assets
alias getpage='wget --no-clobber --page-requisites --html-extension --convert-links --no-host-directories'

# Download file with original filename
alias get="curl -O -L"
