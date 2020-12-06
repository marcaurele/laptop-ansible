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
