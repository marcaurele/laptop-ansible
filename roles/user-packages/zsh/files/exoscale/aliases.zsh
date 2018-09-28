alias cleansshhosts='sed -i "" -e "/exoscale/d" -e "/^159\.100/d" -e "/^185\.19/d" $HOME/.ssh/known_hosts'
alias devdockerdb='grep -rIl -E "mysql.*127\.0\.0\.1" envdir tests | xargs sed -i "" -E "s/127.0.0.1/192.168.99.100/g"'
alias gitpushmarco='git push origin -f HEAD:user/marco'
alias puppetcleanup='ssh `find-exo-hosts infra-cfg0 | sort | head -1` "cd /etc/puppet/environments/marco/ && sudo git clean -fxd && sudo rm -rf modules && sudo librarian-puppet install"'

alias demo_api='echo $DEMO_API_KEY | pbcopy'
alias demo_secret='echo $DEMO_SECRET_KEY | pbcopy'

alias dev_update='pip install --upgrade pip && pip install -r requirements-dev.txt && npm install'

alias restart-cassandra='for h in `find-exo-hosts store-store|ack -v pp`; do echo $h; ssh root@$h /root/toolbox/cassandra-restart.sh; done'

alias csppdb='ssh `find-exo-hosts virt-db-pp|sort|head -1` -L 3308:localhost:3306'
alias csdb='ssh `find-exo-hosts virt-db|ack -v pp|sort|head -1` -L 3307:localhost:3306'
alias cfppdb='ssh `find-exo-hosts portal-db-pp|sort|head -1` -L 3310:localhost:3306'
alias cfdb='ssh `find-exo-hosts portal-db|ack -v pp|sort|head -1` -L 3309:localhost:3306'
alias vmbyip='~/exoscale/toolbox/.venv/bin/toolbox cloudstack --region=prod:admin vm-by-ip '
alias vmbyid='~/exoscale/toolbox/.venv/bin/toolbox cloudstack --region=prod:admin vm-by-id '
