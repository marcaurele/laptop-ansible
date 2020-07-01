# Pipe my public key to my clipboard.
alias pubkey="cat ~/.ssh/id_ed25519.pub | xclip -sel clip"
alias pubkey-rsa="cat ~/.ssh/id_rsa.pub | xclip -sel clip"
alias pubgkey="gpg --armor --export m@brothier.org | xclip -sel clip"
