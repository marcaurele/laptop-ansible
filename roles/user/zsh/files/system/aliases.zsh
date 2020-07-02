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
