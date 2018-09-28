# Exoscale aliases
alias csdev-go='cd $HOME/exoscale/cloudstack'
alias csdev-build='mvn -P kvm,exoscale,developer -Dsimulator -Dmaven.test.skip=true $1'
alias csdev-buildwithtest='mvn -P kvm,exoscale,systemvm,developer -Dsimulator $1'
alias csdev-deploydb='MAVEN_OPTS=$MAVEN_OPTS_DEBUG mvn -Pdeveloper -pl developer -Ddeploydb'
alias csdev-deploysimulator='MAVEN_OPTS=$MAVEN_OPTS_DEBUG mvn -Pdeveloper -pl developer -Ddeploydb-simulator'
alias csdev-start='java -Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.port=45219 -Dcom.sun.management.jmxremote.rmi.port=45219 -Dcom.sun.management.jmxremote.ssl=false -Djava.rmi.server.hostname=127.0.0.1 -Xdebug -Xnoagent -Xrunjdwp:transport=dt_socket,address=8787,server=y,suspend=n -Djava.net.preferIPv4Stack=true -Dlog4j.configuration=log4j-cloud.xml -cp "client/target/conf:`find client/target/lib/ -type f -name "*jar"`:`find client/target -type f -name "cloud-client-*-exoscale-*"`" org.apache.cloudstack.ServerDaemon'
alias csdev-installdc='python tools/marvin/marvin/deployDataCenter.py -i setup/dev/advanced.cfg'

alias csdev-dump='mysqldump --complete-insert --skip-lock-tables --extended-insert=FALSE --ignore-table=cloud.usage_event --ignore-table=cloud.event'

# Apache CloudStack aliases
alias acsdev-go='cd $HOME/code/cloudstack-public'
alias acsdev-build='mvn -P developer,systemvm -Dsimulator -Dnoredist'
alias acsdev-findbugs='mvn -P enablefindbugs cobertura:cobertura'
alias acsdev-deploydb='MAVEN_OPTS=$MAVEN_OPTS_DEBUG mvn -P developer -pl developer -Ddeploydb'
alias acsdev-deploysimulator='MAVEN_OPTS=$MAVEN_OPTS_DEBUG mvn -P developer -pl developer -Ddeploydb-simulator'
alias acsdev-start='MAVEN_OPTS=$MAVEN_OPTS_DEBUG mvn -pl :cloud-client-ui -Dsimulator jetty:run'
alias acsdev-deploydc='python tools/marvin/marvin/deployDataCenter.py -i setup/dev/advanced.cfg'
alias acsdev-testsimulator='nosetests --with-marvin --marvin-config=setup/dev/advanced.cfg -a tags=advanced,required_hardware=false --hypervisor=simulator test/integration/smoke'
