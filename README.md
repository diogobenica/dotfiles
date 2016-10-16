dotfiles
========

My personal dotfiles. It's more like a backup for me. So, use it by your own risk! :)
It works on my MacBook and there is some things specially for Macs, so be careful when copying to your own dotfile.

- Installs many apps via brew and cask (see setup/brew)
- Install Ruby via RVM
- Configuration for Homebrew, iTerm2, RVM and Spectacle.
- Copy the ColorPicker and blueutil app.
- Choose RVM gemset with same directory name on every directory change
- Set Git aliases
- Set bash aliases

The auto installer backups all your dotfiles in user directory (~/) into a folder called "dotfiles_old"

To run the installer:

    ./setup.sh

It will ask you some questions and tell what it is doing at the moment. Very recommended to modify the installer before run, because there is not many optional choices to make at the moment (it will install my iTerm2 preferences, by exemple).
