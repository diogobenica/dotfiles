GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true

print_error(){
  echo "*******************************"
  echo $1
  echo "*******************************"
}
source_or_error(){
  file=$1
  if [ -f $file ]; then
    source $file
  else
    err_msg=$2
    print_error "$err_msg"
  fi
}

# load color
source ~/.bash_colors
# mac homebew
export PATH="/usr/local/bin:$PATH:~/homebrew/bin"
# rvm loader
source_or_error ~/.rvm/scripts/rvm "No RVM installed"

# rvm function for ruby version
if [ -s "$HOME/.rvm/bin/rvm-prompt" ]; then
  __rvm_ps1()
  {
    local r=`~/.rvm/bin/rvm-prompt`
    if [ -n "$r" ]; then
      printf " $r"
    fi
  }
fi
# function exists?
fn_exists()
{
  type $1 2>/dev/null | grep -q 'is a function'
}
# makes your terminal line looks like that: "[user@machine:current_directory ruby_version git_branch]"
# i like to leave one blank line between commands
PS1="\n$WHITE[$CYAN\u$CYANBOLD@$CYAN\h:$REDBOLD\w"
if fn_exists "__rvm_ps1"; then
  PS1=$PS1"$BLACKBOLD\$(__rvm_ps1)"
fi
if fn_exists "__git_ps1"; then
  PS1=$PS1"$YELLOWBOLD\$(__git_ps1 \" %s\")"
fi
PS1=$PS1"$WHITE]\n $WHITEBOLD\$$WHITE "
# load exports and aliases files
[[ -s "$HOME/.bash_exports" ]] && . "$HOME/.bash_exports"
[[ -s "$HOME/.bash_aliases" ]] && . "$HOME/.bash_aliases"
export PATH=/usr/local/sbin:$PATH
