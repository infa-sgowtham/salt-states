# -*- mode: ruby -*-
# vi: set ft=ruby :

# Salt provisioning: vagrant gem install vagrant-salt

Vagrant::Config.run do |config|

  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  #config.vm.boot_mode = :gui

  config.vm.network :hostonly, "10.11.11.10"
  # config.vm.network :bridged

  #config.vm.forward_port 8000, 8000

  # Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.
  # config.vm.share_folder "v-data", "/vagrant_data", "../data"

  config.vm.share_folder "salt_file_root", "/srv", "salt/roots/"
  config.vm.provision :salt do |salt|
    salt.run_highstate = true
    salt.minion_config = "salt/minion.conf"
  end

end
