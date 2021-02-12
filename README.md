# Ansible playbook to configure my laptop

This playbook is my laptop's configuration for both private and work, running
Debian or Ubuntu distributions. You should install the base OS with a SSH server
and run the playbook from another host initialy which will create the user.
After the 1st run, you can run the `update.sh` script from the user home.


## Run the installation

```console
$ ./update.sh
```


## Test on vagrant box

```console
$ ./vagrant-test.sh
```

## VPN connection

To add the AWS network ranges to go through the VPN, download the latest
file at https://docs.aws.amazon.com/general/latest/gr/aws-ip-ranges.html.
Insert them in the VPN entry with:
```console
# IPv4
curl --silent https://ip-ranges.amazonaws.com/ip-ranges.json \
  | jq -r '.prefixes | .[].ip_prefix' \
  | tr '\n' ',' \
  | sed 's/,$//' \
  | xargs nmcli connection modify <vpn-name> ipv4.routes

# IPv6
curl --silent https://ip-ranges.amazonaws.com/ip-ranges.json \
  | jq -r '.ipv6_prefixes | .[].ipv6_prefix' \
  | tr '\n' ',' \
  | sed 's/,$//' \
  | xargs nmcli connection modify <vpn-name> ipv6.routes
```
