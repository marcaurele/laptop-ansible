# {{ ansible_managed }}
abbr --add -- consul-token "set -x CONSUL_HTTP_TOKEN ({{ caas.consul_http_token }})"
abbr --add -- nomad-token "set -x NOMAD_TOKEN ({{ caas.nomad_token }})"

set -x NOMAD_ADDR {{ caas.nomad_addr }}
set -x CONSUL_HTTP_ADDR {{ caas.consul_http_addr }}