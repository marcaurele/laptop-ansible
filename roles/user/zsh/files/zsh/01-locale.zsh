# -*- sh -*-

(( $+commands[locale] )) && () {
    local available
    local locales
    local locale
    locales=( "LANG fr_CH.utf8 fr_CH.UTF-8 en_US.utf8 en_US.UTF-8 C.utf8 C.UTF-8 C"
	      "LC_MESSAGES en_US.utf8 en_US.UTF-8 fr_CH.utf8 fr_CH.UTF-8 C.utf8 C.UTF-8 C"
	      "LC_TIME en_CA.utf8 en_CA.UTF-8 fr_CH.utf8 fr_CH.UTF-8 en_US.utf8 en_US.UTF-8"
	      "LC_NUMERIC en_US.utf8 en_US.UTF-8 C.utf8 C.UTF-8 C" )
    available=("${(f)$(locale -a)}")
    for locale in $locales; do
	for l in $=locale[(w)2,-1]; do
            if (( ${available[(i)$l]} <= ${#available} )); then
		export $locale[(w)1]=$l
		break
	    fi
	done
    done
    export LC_CTYPE=$LANG
    unset LC_ALL
} 2> /dev/null
