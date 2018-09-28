# Aliases
alias runhttp='python3 -m http.server'

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Delete all .pyc files
alias cleanpyc='find . -type f -name "*.pyc" -delete'

exo_recreate_pyvenv_fn() {
	if [ -e "$PWD/.venv" ]; then
		if type deactivate > /dev/null; then
			deactivate
		fi
		rm -rf $PWD/.venv
		python3 -m venv .venv
		source $PWD/.venv/bin/activate
		pip install -r requirements-dev.txt
	fi
}

alias exo_recreate_pyvenv="exo_recreate_pyvenv_fn"