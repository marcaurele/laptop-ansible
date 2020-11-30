# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|
  config.vm.box = "generic/debian10"

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
    sudo apt-get install -qy bluetooth
  SHELL

  if ENV.has_key?('SSH_KEY')
    SSH_KEY = ENV['SSH_KEY']
    puts("Inserting SSH key #{Dir.home}/.ssh/#{SSH_KEY}.pub into vagrant box")
    config.vm.provision "shell" do |s|
      s.privileged = false
      ssh_pub_key = File.readlines("#{Dir.home}/.ssh/#{SSH_KEY}.pub").first.strip
      s.inline = <<-EOF
echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
sudo mkdir -p /root/.ssh/
sudo chmod 0700 /root/.ssh/
sudo cp /home/vagrant/.ssh/authorized_keys /root/.ssh/authorized_keys
EOF
    end
  end
end
