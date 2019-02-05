# Only for OSX
if [[ "$(uname -s)" == "Darwin" ]]; then
    echo "Hmmm working on OSX"
    eval "$(jenv init -)"
fi

export MAVEN_OPTS_DEFAULT='-Xmx1024m -Djava.net.preferIPv4Stack=true'
export MAVEN_OPTS_DEBUG='-Xmx1024m -Xdebug -Xrunjdwp:transport=dt_socket,address=8787,server=y,suspend=n -Djava.net.preferIPv4Stack=true'
export MAVEN_OPTS=$MAVEN_OPTS_DEFAULT
