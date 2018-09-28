function git_remove_tag() {
    if [ -n "$1" ]
    then
        git tag -d "$1"
        git push origin :refs/tags/"$1"
    fi
}

# The rest of my fun git aliases
alias g='git'
alias gl='git pull --prune'
alias gd='git diff'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias gitremovetag='git_remove_tag'
