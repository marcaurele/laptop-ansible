# Password store aliases for other reposiroties
# LADB
compdef _pass passladb
zstyle ':completion::complete:passladb::' prefix "$HOME/code/lairdubois-pass"
passladb() {
  PASSWORD_STORE_DIR=$HOME/code/lairdubois-pass pass $@
}

# WORK
compdef _pass passpix4d
passpix4d {
  PASSWORD_STORE_DIR=$HOME/code/platform-cloud-services-passwordstore pass $@
}

# Hetzner cloud completion if present
if type hcloud > /dev/null; then
	eval "$(hcloud completion zsh)"
fi
