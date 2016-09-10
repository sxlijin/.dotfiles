#!/bin/bash

echo "Running custom updates..."

echo "# automatically generated using dircolors(1) via --print-database" > dircolors && \
echo "#" >> dircolors && \
dircolors --print-database >> dircolors \
    && echo "Updated dircolors"

curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash \
    -o git/git-completion.bash \
    && echo "Updated git/git-completion.bash"

curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh \
    -o git/git-prompt.sh \
    && echo "Updated git/git-prompt.sh"

git submodule update --remote \
    && echo "Updated git submodules"
