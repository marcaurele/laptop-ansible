# {{ ansible_managed }}
set -x NOMAD_ADDR {{ caas.nomad_addr }}
set -x CONSUL_HTTP_ADDR {{ caas.consul_http_addr }}