# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/testing64"
  config.disksize.size = "250GB"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
    vb.cpus = 4
  end

  # Inject my own SSH keys for root and vagrant
  # config.ssh.insert_key = false
  config.vm.provision "shell" do |s|
    ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
    s.inline = <<-SHELL
      echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
      mkdir -p /root/.ssh
      echo #{ssh_pub_key} >> /root/.ssh/authorized_keys
      apt install -y python-apt cloud-guest-utils
    SHELL
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.verbose = "v"
    ansible.vault_password_file = "~/Private/ansible/laptop"
  end

end
