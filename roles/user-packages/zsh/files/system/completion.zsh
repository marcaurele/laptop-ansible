# Password store aliases for other reposiroties
# LADB
compdef _pass passladb
zstyle ':completion::complete:passladb::' prefix "$HOME/code/lairdubois-pass"
passladb() {
  PASSWORD_STORE_DIR=$HOME/code/lairdubois-pass pass $@
}

