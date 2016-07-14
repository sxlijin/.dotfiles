#! /bin/sh

# Runs the appropriate commands to set up this .vimrc.

git submodule update --init --recursive
sudo apt install vim-python-jedi

dotfiles_dir=$(git rev-parse --show-toplevel)
if [ ! -d ~/.vim/ ]; then
    ln -s ${dotfiles_dir}/vim ~/.vim
    ln -s .vim/vimrc ~/.vimrc
fi
ln -s ${dotfiles_dir}/bash_aliases ~/.bash_aliases
ln -s ${dotfiles_dir}/screenrc ~/.screenrc
ln -s ${dotfiles_dir}/inputrc ~/.inputrc
ln -s ${dotfiles_dir}/git/ignore ~/.gitignore

git config --global include.path ${dotfiles_dir}/git/config
