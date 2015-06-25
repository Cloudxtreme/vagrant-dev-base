# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.network "private_network", ip: "192.168.33.33"
  config.vm.hostname = "vagrant.dev"
  config.hostsupdater.remove_on_suspend = true

  config.vm.synced_folder "./dist", "/var/www", :owner => "www-data", :mount_options => [ "dmode=775", "fmode=774" ]

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "512"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  # Vagrant triggers
  # config.trigger.before :halt, :stdout => true do
  #   info "Dumping the database before stopping the VM..."
  #   run  "vagrant ssh -c 'mysqldump -u root nzedb > /vagrant/nzedb.sql'"
  # end
  #
  # config.trigger.before :destroy, :stdout => true do
  #   info "Dumping the database before destroying the VM..."
  #   run  "vagrant ssh -c 'mysqldump -u root nzedb > /vagrant/nzedb.sql'"
  # end

  config.vm.provision "shell", :path => "vagrant/bootstrap.sh"

end

