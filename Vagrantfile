Vagrant.configure("2") do |c|
  c.berkshelf.enabled = false if Vagrant.has_plugin?("vagrant-berkshelf")
  c.vm.box = "sbeliakou-vagrant-centos-6.8-x86_64"
  c.vm.hostname = "default-sbeliakou-vagrant-centos-68-x86-64.vagrantup.com"
  c.vm.synced_folder ".", "/vagrant", disabled: true
  c.vm.provider :virtualbox do |p|
  end
end
