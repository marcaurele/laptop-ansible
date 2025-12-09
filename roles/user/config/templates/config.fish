# {{ ansible_managed }}

abbr --add gitlab-registry-auth -- "pass web/com/gitlab/marcaurele-token-registry-ro | docker login registry.gitlab.com -u marcaurele --password-stdin"

abbr --add apt-update -- "sudo apt-get update; and sudo apt-get upgrade --yes; and sudo apt-get dist-upgrade --yes; and sudo apt-get autoremove --purge --yes; and sudo apt-get clean"

set -x PATH $PATH /snap/bin

abbr --add passuser --set-cursor  "pass % | grep username | cut -c 11- | xclip -selection clipboard"
