# List all files with permissions and dates
alias ll='ls -alF'
# List all files except . and ..
alias la='ls -A'
# List in columns
alias ls='ls -CF'
# Laziness for parent directory
alias ..='cd ..'
# Python Simple Server
alias server='python -m SimpleHTTPServer'
# cd and sublime :)
cdAndSublime(){
  cd $1
  s .
}
alias cds=cdAndSublime
# ps + grep
alias psg='ps -ef | grep -v grep | grep'
# Reload dotfiles
alias rebash='source ~/.bash_profile'
# Open hosts in vim
alias vihost='sudo vim /etc/hosts'
# Set the tab name in iTerm2
iTermTabName(){
  echo -e "\033];$1\007" 1> /dev/null
}
alias tn=iTermTabName
# Only IP
alias ip='ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\ -f2'