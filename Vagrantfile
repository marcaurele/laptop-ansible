# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|
  #config.vm.box = "generic/debian10"
  config.vm.box = "generic/ubuntu2004"

  config.vm.box_check_update = true

  config.vm.synced_folder "../data", "/vagrant_data", disabled: true

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "libvirt" do |v|
    v.memory = "1024"
    v.cpus = 2
  end

  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    sudo apt-get update
    sudo apt-get upgrade -qy
    # To install bluetooth group
    sudo apt-get install -qy gpg bluetooth
    if [ ! $(gpg -k | grep CC5D549DBE7E9162) ]; then
        gpg --batch --keyserver keys.openpgp.org  --recv-keys CC5D549DBE7E9162
        gpg --export-ssh-key CC5D549DBE7E9162 >> /home/vagrant/.ssh/authorized_keys
    fi
  SHELL

end
