#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=$(pwd)                  # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bash_aliases bash_colors bash_exports bash_profile bashrc gemrc gitconfig irbrc"    # list of files/folders to symlink in homedir

##########
echo "I'll move your actual dotfiles to ~/dotfiles_old"
echo "After that, I'm going to make symlinks to ~/ of the dotfiles"

# create dotfiles_old in homedir
mkdir -p $olddir

# change to the dotfiles directory
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    mv ~/.$file $olddir/ 2> /dev/null
    ln -s $dir/.$file ~/.$file 2> /dev/null
done
echo "Dotfiles done!"

# copy files
echo "Now I'll copy some preferences files"
ITERM_RUNNING=$(ps -ef | grep iTerm | grep -cv grep)
if [[ ($ITERM_RUNNING > 0) ]]; then
  echo "[error] iTerm profile file wasn't copied"
  echo "******** Close iTerm and run from Terminal.app to update the profile file ********"
else
  rm ~/Library/Preferences/com.googlecode.iterm2.plist
  ln -s $dir/files/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist
  # don't read from cache
  defaults read com.googlecode.iterm2
fi

SPECTACLE_RUNNING=$(ps -ef | grep Spectacle.app | grep -cv grep)
if [[ ($SPECTACLE_RUNNING > 0) ]]; then
  echo "[error] Spectacle profile file wasn't copied"
  echo "******** Close Spectacle to update the profile file ********"
else
  rm ~/Library/Preferences/com.divisiblebyzero.Spectacle.plist
  ln -s $dir/files/com.divisiblebyzero.Spectacle.plist ~/Library/Preferences/com.divisiblebyzero.Spectacle.plist
  # don't read from cache
  defaults read com.divisiblebyzero.Spectacle.plist
fi

source ~/.bash_profile
