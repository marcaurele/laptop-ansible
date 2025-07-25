# {{ ansible_managed }}
# Git
abbr --add --position anywhere --set-cursor='%' -- gcm git\ commit\ -m\ \"\%\"
abbr --add -- gitprune "git branch -v|grep '\\[gone\\]'|awk '{print \$1}'|xargs -I{} git branch -D {}"

# Keyboard
abbr --add -- kus "setxkbmap us -variant altgr-intl -option -option ctrl:nocaps -option compose:rctl-altgr"
abbr --add -- kch "setxkbmap ch fr -option -option ctrl:nocaps"

# System
abbr --add -- sshpass "ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no"
abbr --add -- sshskip "ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
abbr --add -- ykforget "gpg-connect-agent 'scd serialno' 'learn --force' /bye"

abbr --add -- screen-disable-blank "xset -dpms s off"
abbr --add -- screen-enable-blank "xset -dpms s on"
abbr --add -- ocrallpdf "find . -printf '%p\n' -name '*.pdf' -exec ocrmypdf '{}' '{}' \;"

abbr --add -- gensecret "pwgen -sy -1 30"