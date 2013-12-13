Vagrant.configure("2") do |config|
  config.vm.box = "sprinkle"
  config.vm.box_url = "http://files.vagrantup.com/lucid32.box"
  config.vm.network "forwarded_port", guest: 22, host: 22222
  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", 256]
  end
end
