# Little trick to start the SSH agent on OSX
if [[ "$(uname -s)" == "Darwin" ]]; then
    pgrep ssh-agent > /dev/null || /usr/bin/ssh-agent -a /Users/marco/.ssh-agent.sock
    export SSH_AUTH_SOCK="/Users/marco/.ssh-agent.sock"
fi
