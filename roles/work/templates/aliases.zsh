# {{ ansible_managed }}
alias curljwt='curl --silent -H "Authorization: Bearer $JWT_TOKEN"'

function aws_describe_instances_table () {
  local env=$1
  local type=$2
  aws ec2 describe-instances \
      --filters Name=tag:role,Values=$type Name=tag:Stack,Values=$env \
      --query "Reservations[].Instances[].[PrivateIpAddress,InstanceId,LaunchTime,Placement.AvailabilityZone,[Tags[?Key=='Name'].Value][0][0],[Tags[?Key=='role'].Value][0][0]]" \
      --output table
}

_aws_describe_instances_table_celery () {
  local env=$1
  aws ec2 describe-instances \
      --filters Name=tag:role,Values=celery Name=tag:Stack,Values=$env \
      --query "Reservations[].Instances[].[PrivateIpAddress,InstanceId,LaunchTime,Placement.AvailabilityZone,[Tags[?Key=='Name'].Value][0][0],[Tags[?Key=='role'].Value][0][0],[Tags[?Key=='subrole'].Value][0][0]]" \
      --output table
}

alias aws-prod-django='aws_describe_instances_table prod django'
alias aws-staging-django='aws_describe_instances_table staging django'
alias aws-prod-celery='_aws_describe_instances_table_celery prod'
alias aws-staging-celery='_aws_describe_instances_table_celery staging'

alias vpn-on="/usr/bin/expect -c 'spawn nmcli connection up {{ company }} --ask; expect \"Username\"; send \"{{ username }}\r\"; expect -re \"Password\" {; send -- [exec pass {{ company }}/jumpcloud | head -1]; send \",\"; send -- [exec pass otp {{ company }}/jumpcloud]\r; }; interact; puts \"\nDone\n\"; exit;'"
alias vpn-off="nmcli connection down {{ company }}"
