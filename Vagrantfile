Vagrant.configure("2") do |config|
  config.vm.provision "shell", path: "provision.sh"
  config.vm.box = "codecool/ubuntu-18.04-base"
  config.vm.provider "virtualbox"
  config.vm.network :bridged
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.synced_folder "synced/", "/tmp/synced"
end
