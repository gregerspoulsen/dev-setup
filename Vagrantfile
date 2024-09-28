# -*- mode: ruby -*-
# vi: set ft=ruby :

# Install required vagrant plugins:
# required_plugins = %w[vagrant-reload vagrant-nixos-plugin vagrant-persistent-storage]
# plugins_to_install = required_plugins.reject { |plugin| Vagrant.has_plugin? plugin }
# unless plugins_to_install.empty?
#   puts "Installing plugins: #{plugins_to_install.join(' ')}"
#   if system "vagrant plugin install #{plugins_to_install.join(' ')}"
#     exec "vagrant #{ARGV.join(' ')}"
#   else
#     abort 'Installation of one or more plugins has failed. Aborting.'
#   end
# end

# Configure VM
Vagrant.configure("2") do |config|

  # Default values can be overwritten with .vagrantuser. See .vagrantuser.example
  config.user.defaults = {
    "user" => "gp", 
    "pwd" => "test",
    # "user_repo" => "https://github.com/gregerspoulsen/sys-setup-gp.git",
    # "host_mount" => false, # Map host folder at ~/sytup/
    # "user_vars" => {}
  }

  # VM Configuration
  config.vm.box = "nixbox/nixos" # Ubuntu 20.04 64-bit

  # Setup Bridged Network
  # Target name can be found with: VBoxManage.exe list bridgedifs
  #config.vm.network "public_network", bridge: "Intel(R) Ethernet Connection (7) I219-V"
  # config.vm.network "public_network", bridge: "Realtek USB 2.5GbE Family Controller"

  config.vm.provider :virtualbox do |v|
    v.gui = true # Display UI 
    v.memory = 4000
    v.cpus = 2
    v.customize ["modifyvm", :id, "--vram", "128"] # 128 MB Video Memory
    v.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
    v.customize ['modifyvm', :id, '--draganddrop', 'bidirectional']
    v.customize ['modifyvm', :id, '--nested-hw-virt', 'on']
    v.customize ["modifyvm", :id, "--usb", "on"] # Enable USB
    v.customize ["modifyvm", :id, "--usbxhci", "on"] # Enable USB3
    v.customize ['modifyvm', :id, '--graphicscontroller', 'vmsvga']
    v.customize ['modifyvm', :id, '--accelerate3d', 'off'] # Enable 3D Acceleration


  end

  # Increase Disk Size from 40GB to 200GB
  config.vm.disk :disk, size: "300GB", primary: true

  # Add the htop package
  config.vm.provision :nixos, path: "configuration.nix"#, run: 'always'
  config.vm.provision :reload  
  # Run Bootstrap:
  config.vm.provision "shell",
    path: "bootstrap.sh"
  config.vm.provision :reload


  # config.persistent_storage.enabled = false
  # config.persistent_storage.location = "H:/dev_persistent.vdi"
  # config.persistent_storage.size = 200000
  # config.persistent_storage.mountname = 'dev'
  # config.persistent_storage.filesystem = 'ext4'
  # config.persistent_storage.mountpoint = '/home/gp/dev'
  # config.persistent_storage.diskdevice = '/dev/sdd'

  config.vm.synced_folder "./", "/home/vagrant/vagrant-nix"

  # config.vm.provision :reload
end