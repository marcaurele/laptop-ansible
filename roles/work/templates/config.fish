# {{ ansible_managed }}
abbr --add -- vpn-off "nmcli connection down {{ company }}"
abbr --add -- curljwt 'curl --silent -H "Authorization: Bearer $JWT_TOKEN"'

if command -sq aws-vault
    set -x KEEPER_CONFIG_FILE ~/.config/keeper/config.json
end

# AWS related stuff
function aws-describe-instances-table -a env type
    aws ec2 describe-instances \
        --filters Name=tag:role,Values=$type Name=tag:Stack,Values=$env \
        --query "Reservations[].Instances[].[PrivateIpAddress,InstanceId,LaunchTime,Placement.AvailabilityZone,[Tags[?Key=='Name'].Value][0][0],[Tags[?Key=='role'].Value][0][0]]" \
        --output table
end

alias aws-prod-django="aws-describe-instances-table prod django"
alias aws-prod-celery="aws-describe-instances-table prod celery"