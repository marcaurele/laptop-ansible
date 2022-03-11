# {{ ansible_managed }}
# pyenv configuration
export PYENV_ROOT="$HOME/.pyenv"
export PATH="${PATH}:$HOME/.pyenv/bin:$HOME/.pyenv/shims"
export PYENV_SHELL=zsh
export PIPENV_VENV_IN_PROJECT=1
source "$HOME/.pyenv/completions/pyenv.zsh"
command pyenv rehash 2>/dev/null
pyenv() {
  local command
  command="${1:-}"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(pyenv "sh-$command" "$@")"
    ;;
  *)
    command pyenv "$command" "$@"
    ;;
  esac
}
