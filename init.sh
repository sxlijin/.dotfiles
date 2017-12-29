#!/bin/sh

# Runs the appropriate commands to set up the dotfiles configuration.

git submodule update --init --recursive

dotfiles_dir=$(git rev-parse --show-toplevel)

tstamp="$(date "+%F-%T")"
tstamp="${tstamp//:/-}"

while read link_dest link_ptr
do
    link_ptr="${HOME}/${link_ptr}"

    test -e "${link_ptr}" \
        && echo "[WARN] file/dir exists: ${link_ptr}" \
        && mv "${link_ptr}" "${link_ptr}_${tstamp}.bak"

    ln -s "${link_dest}" "${link_ptr}"

done << HERE_DOC
${dotfiles_dir}/bash/profile    .bash_profile
${dotfiles_dir}/bash/rc         .bashrc
${dotfiles_dir}/bash/aliases    .bash_aliases
${dotfiles_dir}/bash/locals     .bash_locals
${dotfiles_dir}/git/ignore      .gitignore
${dotfiles_dir}/inputrc         .inputrc
${dotfiles_dir}/screenrc        .screenrc
${dotfiles_dir}/tmux.conf       .tmux.conf
${dotfiles_dir}/vim             .vim
.vim/vimrc                      .vimrc
HERE_DOC

# don't symlink this: global git config will include machine-specific config
git config --global include.path ${dotfiles_dir}/git/config

# tell git to ignore changes in bash/locals
git update-index --assume-unchanged ${dotfiles_dir}/bash/locals
