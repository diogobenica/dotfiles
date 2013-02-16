PATH="$PATH:/Users/diogo/homebrew/bin"
source /Users/diogo/.rvm/scripts/rvm

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# set history size
HISTSIZE=1000
HISTFILESIZE=2000

# git completion
GIT_COMPLETION=/usr/local/git/contrib/completion/git-completion.bash
[[ -s $GIT_COMPLETION ]] && source $GIT_COMPLETION

if [ -s "$HOME/.rvm/bin/rvm-prompt" ]; then
  __rvm_ps1()
  {
    local r=`~/.rvm/bin/rvm-prompt`
    if [ -n "$r" ]; then
      printf " $r"
    fi
  }
fi

fn_exists()
{
  type $1 2>/dev/null | grep -q 'is a function'
}

# makes your terminal line looks like that: "[user@machine:current_directory git_branch"
# i like to leave one blank line between commands
PS1='\n\[\033[00;37m\][\[\033[00;37m\]\u@\h:\[\033[00;36m\]\w'
if fn_exists "__rvm_ps1"; then
  PS1=$PS1
fi
if fn_exists "__git_ps1"; then
  PS1=$PS1'\[\033[00;33m\]$(__git_ps1 " %s")'
fi
PS1=$PS1'\[\033[00;37m\]]\n\[\033[01;37m\] \$\[\033[00m\] '

[[ -s "$HOME/.bash_exports" ]] && . "$HOME/.bash_exports"
[[ -s "$HOME/.bash_aliases" ]] && . "$HOME/.bash_aliases"

if [ `which brew 2> /dev/null` ] && [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
[[ -s "$HOME/.nvm/nvm.sh" ]] && . "$HOME/.nvm/nvm.sh"
