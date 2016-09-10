#!/bin/sh

# Runs the appropriate commands to set up the dotfiles configuration.

git submodule update --init --recursive

dotfiles_dir=$(git rev-parse --show-toplevel)
if [ ! -d ~/.vim/ ]; then
    # symlink the vim files
    ln -s ${dotfiles_dir}/vim ~/.vim
    ln -s .vim/vimrc ~/.vimrc
fi

# symlink the bash/ config files
ln -s "${dotfiles_dir}/bash/profile" ~/.bash_profile
ln -s "${dotfiles_dir}/bash/rc" ~/.bashrc
ln -s "${dotfiles_dir}/bash/aliases" ~/.bash_aliases

# symlink other files
ln -s "${dotfiles_dir}/screenrc" ~/.screenrc
ln -s "${dotfiles_dir}/inputrc" ~/.inputrc
ln -s "${dotfiles_dir}/git/ignore" ~/.gitignore

# don't symlink this: global git config will include machine-specific config
git config --global include.path ${dotfiles_dir}/git/config
