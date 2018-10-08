# Pipe my public key to my clipboard.
if [[ "$(uname -s)" == "Darwin" ]]; then
	alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"
else
	alias pubkey="cat ~/.ssh/id_rsa.pub | xclip -sel clip"
fi
