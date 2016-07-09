#! /bin/bash

# gets the dirname of this script, resolving all symlinks
# from http://stackoverflow.com/a/246128/3577414
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

echo $DIR

alias v='vim -p'
alias c='clear'
alias g='git'

# set up autocompletion for git alias
. ${DIR}/git/git-completion.bash
__git_complete g _git
