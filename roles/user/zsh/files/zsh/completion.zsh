# enable zsh-completions package
#fpath=(/usr/local/share/zsh-completions $fpath)
fpath=(${HOME}/.zsh $fpath)

# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# completion with lsiting colors
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
