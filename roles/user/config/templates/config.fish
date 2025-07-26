# {{ ansible_managed }}

abbr --add gitlab-registry-auth -- "pass web/com/gitlab/marcaurele-token-registry-ro | docker login registry.gitlab.com -u marcaurele --password-stdin"
