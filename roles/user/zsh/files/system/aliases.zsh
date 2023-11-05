# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
fi

# Fix chmod to D:755, F:644
# http://superuser.com/a/91966/408765
alias chmodfix='chmod -R u+rwX,go+rX,go-w'

alias sshpass="ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no"
alias sshskip="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias ykforget='gpg-connect-agent "scd serialno" "learn --force" /bye'
alias gensecret="< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-32};echo;"
alias gitprune="git branch | grep -vFf <(git branch -r | cut -d'/' -f2-) | xargs git branch -d"

# Keyboard
alias kus="setxkbmap us -variant altgr-intl -option -option ctrl:nocaps -option compose:rctl-altgr"
alias kch="setxkbmap ch fr -option -option ctrl:nocaps"

# Audio tools
alias m4b-tool='docker run -it --rm -u $(id -u):$(id -g) -v "$(pwd)":/mnt sandreas/m4b-tool:latest'
