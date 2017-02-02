#!/bin/sh

# Runs the appropriate commands to set up the dotfiles configuration.

git submodule update --init --recursive

dotfiles_dir=$(git rev-parse --show-toplevel)
if [ ! -d ~/.vim/ ]; then
    # symlink the vim files
    ln -s ${dotfiles_dir}/vim ~/.vim
    ln -s .vim/vimrc ~/.vimrc
fi

while read link_dest link_ptr
do
    link_ptr="${HOME}/${link_ptr}"

    test -f "${link_ptr}" \
        && echo "file exists: ${link_ptr}" \
        && mv "${link_ptr}" "${link_ptr}.bak"
    ln -s "${link_dest}" "${link_ptr}"
done << HERE_DOC
${dotfiles_dir}/bash/profile    .bash_profile
${dotfiles_dir}/bash/rc         .bashrc
${dotfiles_dir}/bash/aliases    .bash_aliases
${dotfiles_dir}/bash/locals     .bash_locals
${dotfiles_dir}/screenrc        .screenrc
${dotfiles_dir}/inputrc         .inputrc
${dotfiles_dir}/git/ignore      .gitignore
HERE_DOC

# don't symlink this: global git config will include machine-specific config
git config --global include.path ${dotfiles_dir}/git/config
