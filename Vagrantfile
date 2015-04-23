# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 5601, host: 5601
  config.vm.network "forwarded_port", guest: 9200, host: 9200

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  config.vm.provision "shell", path: "provisioning/apt-get-updates.sh"
  config.vm.provision "shell", path: "provisioning/es-install.sh"
  config.vm.provision "shell", path: "provisioning/es-snapshot-restore.sh"
  config.vm.provision "shell", path: "provisioning/kibana3-install.sh"
  config.vm.provision "shell", path: "provisioning/logstash-install.sh"

end
