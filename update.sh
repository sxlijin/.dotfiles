#! /bin/bash

echo "Running custom updates..."
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o git/git-completion.bash
git submodule update --remote
