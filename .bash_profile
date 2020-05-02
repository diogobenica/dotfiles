GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

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

# load youse config
source ~/.youse
# load color
source ~/.bash_colors
# mac homebew
export PATH="/usr/local/bin:$PATH:~/homebrew/bin"
# rvm loader
source_or_error ~/.rvm/scripts/rvm "No RVM installed"
# bash completion
source_or_error $(brew --prefix)/etc/bash_completion "No bash-completion installed"
# git completion
source_or_error $(brew --prefix)/etc/bash_completion.d/git-completion.bash "No git-completion installed"
# git prompt
source_or_error $(brew --prefix)/etc/bash_completion.d/git-prompt.sh "No git-prompt installed"
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
if [ $AWS_PS1_PROFILE ]; then
  PS1=$PS1"$AWS_PS1_PROFILE"
fi
if fn_exists "__git_ps1"; then
  PS1=$PS1"$YELLOWBOLD\$(__git_ps1 \" %s\")"
fi
PS1=$PS1"$WHITE]\n $WHITEBOLD\$$WHITE "
# load exports and aliases files
[[ -s "$HOME/.bash_exports" ]] && . "$HOME/.bash_exports"
[[ -s "$HOME/.bash_aliases" ]] && . "$HOME/.bash_aliases"
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export PATH=/usr/local/sbin:$PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/diogo/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/diogo/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/diogo/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/diogo/Downloads/google-cloud-sdk/completion.bash.inc'; fi
# added by Anaconda3 2019.03 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

AWS_PROFILE=default
AWS_DEFAULT_REGION=sa-east-1
export LAZY_BASH=/Users/diogo/.lazy-bash
source $LAZY_BASH/lazy_bash.sh
eval "$(pyenv init -)"
