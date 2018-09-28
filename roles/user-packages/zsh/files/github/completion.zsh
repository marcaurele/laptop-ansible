# Enable completion for python-gist command
if test -f '/home/marco/.local/bin/gist'; then
    completion="$HOME/.local/venvs/python-gist/share/gist/gist.zsh"
    if test -f $completion
    then
        cp -f $completion "$HOME/.zsh/_gist"
    fi
    unset completion
fi
