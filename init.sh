#!/bin/bash

set -ex

# Runs the appropriate commands to set up the dotfiles configuration.

git submodule update --init --recursive

dotfiles_dir=$(git rev-parse --show-toplevel)

tstamp="$(date "+%F-%H-%M-%S")"

while read link_dest link_ptr
do
  link_ptr="${HOME}/${link_ptr}"

  (test -L "${link_ptr}" || test -e "${link_ptr}") \
    && echo "[WARN] file/dir exists: ${link_ptr}" \
    && mv "${link_ptr}" "${link_ptr}_${tstamp}.bak"

  ln -s "${link_dest}" "${link_ptr}"

done << HERE_DOC
${dotfiles_dir}/bash/bash_profile .bash_profile
${dotfiles_dir}/bash/bashrc       .bashrc
${dotfiles_dir}/bash/bash_aliases .bash_aliases
${dotfiles_dir}/git/gitignore     .gitignore
${dotfiles_dir}/inputrc           .inputrc
${dotfiles_dir}/screenrc          .screenrc
${dotfiles_dir}/tmux.conf         .tmux.conf
${dotfiles_dir}/vim               .vim
${dotfiles_dir}/xinitrc           .xinitrc
.vim/vimrc                        .vimrc
.vim/gvimrc                       .gvimrc
HERE_DOC

if [[ $(uname -r) =~ WSL2 ]]; then
  echo "WSL2 detected: bootstrapping"
  windows_user="$(cmd.exe /c 'echo %USERNAME%' | sed -e 's/\s*//g')"
  windows_home="/mnt/c/Users/${windows_user}"

  echo "Bootstrapping VcXsrv..."
  vcxsrv_startup_path="${windows_home}/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup/config.xlaunch"
  rm -f "${vcxsrv_startup_path}"
  cp ~/.dotfiles/wsl2/vcxsrv_config.xlaunch "${vcxsrv_startup_path}"
fi

# don't symlink this: global git config will include machine-specific config
git config --global include.path ${dotfiles_dir}/git/gitconfig
