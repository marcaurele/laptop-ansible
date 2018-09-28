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

# To autoload virtualenv and add node modules bin to local path
# Needs improvement on venv deactivation
has_virtualenv() {
	if [ -e .venv ]; then
		deactivate >/dev/null 2>&1
		# if type deactivate > /dev/null; then
		# 	echo "first, deactivate current one"
		# 	deactivate
		# fi
		source .venv/bin/activate
	fi 
}

has_node_modules() {
	if [ -d node_modules/.bin ]; then
		export _node_modules_oldpath=$PATH
		export PATH=node_modules/.bin:$PATH
		printf "\nAvailable node modules:\n"
		ls node_modules/.bin
	else
		if [ -n "$_node_modules_oldpath" ]; then
			export PATH=$_node_modules_oldpath
			unset _node_modules_oldpath
		fi
	fi
}

has_git_hooks() {
	if [ -L "$PWD/.git/hooks" ]; then
		export _git_hooks_oldpath=$PATH
		export PATH=$PWD/.git/hooks:$PATH
		printf "\nAvailable git hooks:\n"
		ls .git/hooks
	else
		if [ -n "$_git_hooks_oldpath" ]; then
			export PATH=$_git_hooks_oldpath
			unset _git_hooks_oldpath
		fi
	fi
}

development_cd() {
	builtin cd "$@"
	has_virtualenv
	has_node_modules
	#has_git_hooks
}

alias cd="development_cd"

alias sshpass="ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no"
