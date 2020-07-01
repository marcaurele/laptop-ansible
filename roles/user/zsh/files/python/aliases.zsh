# Aliases
alias runhttp='python3 -m http.server'

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Delete all .pyc files
alias cleanpyc='find . -type f -name "*.pyc" -delete'

