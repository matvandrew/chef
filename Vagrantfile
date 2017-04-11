# -*- mode: ruby -*-
# vi: set ft=ruby :

$vm1_ip="192.168.56.111"
$cookbook_dir="~/chef/exittask/cookbooks"
Vagrant.configure(2) do |config|

    config.vm.define "vm11" do |vm11_config|
    vm11_config.vm.box = "sbeliakou/centos-6.8-x86_64"
    vm11_config.vm.network "private_network", ip: $vm1_ip
    vm11_config.vm.hostname = "vm11.mnt.com"
    vm11_config.vm.provider "virtualbox" do |v|
        v.name = "vm11"
        v.customize ["modifyvm", :id, "--memory", 2048] 
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end
    config.vm.provision "chef_solo" do |chef|
      chef.cookbooks_path = $cookbook_dir
      chef.add_recipe "java::default"
      chef.add_recipe "tomcat::default"
      chef.add_recipe "apache::enable_maintenance_mode"
    end
    vm11_config.vm.synced_folder "~/chef", "/var/chef" #, type: "nfs"
  end
end
