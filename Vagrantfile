# -*- mode: ruby -*-
# vi: set ft=ruby :

$vm1_ip="192.168.56.100"
#$cookbook_dir="~/chef/cookbooks"
Vagrant.configure(2) do |config|

    config.vm.define "vm1" do |vm1_config|
    vm1_config.vm.box = "sbeliakou/centos-6.8-x86_64"
    vm1_config.vm.network "private_network", ip: $vm1_ip
    vm1_config.vm.hostname = "vm1.mnt.com"
    vm1_config.vm.provider "virtualbox" do |v|
        v.name = "vm1"
        v.customize ["modifyvm", :id, "--memory", 2048] 
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end
#    config.vm.provision "chef_solo" do |chef|
#      chef.cookbooks_path = $cookbook_dir
#      chef.add_recipe "java::default"
#      chef.add_recipe "jboss::default"
#    end
    vm1_config.vm.synced_folder "~/chef", "/var/chef" #, type: "nfs"
  end
end
