# Make vim the default editor
export EDITOR='vim'

# Fix LC on OSX
# Correctly set the locale
# I'd rather have a en locale than a french one
# and I don't like the US format, so CA is a good option
export LANG='en_US.UTF-8'
export LC_CTYPE='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# For standard sorting in ls, ...
export LC_COLLATE=C

# Don’t clear the screen after quitting a manual page
#export MANPAGER="less -X"

# Sorry Brew, but that's not something I want
export HOMEBREW_NO_ANALYTICS=1

if [[ "$(uname -s)" == "Darwin" ]]; then
    export GREP_OPTIONS="--color=auto"
else
    export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
    #export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh    
fi
