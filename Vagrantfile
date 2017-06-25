Vagrant.require_version ">= 1.7.0"

Vagrant.configure(2) do |config|
  config.vm.box = "debian/jessie64"

  config.vm.network "private_network", ip: "10.1.1.1"

  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "bootstrap.yml"
  end

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", 4096]
    vb.customize ["modifyvm", :id, "--cpus", 8]
    vb.customize ["modifyvm", :id, "--usb", "on"]

    # Connect Orion StarShoot Autoguider
    vb.customize ["usbfilter", "add", "0",
      "--name", "QHY5-CMOS",
      "--action","hold",
      "--target", :id,
      "--vendorid", "0x16c0",
      "--productid", "0x296d"
    ]
  end

  # Expose brain, portainer HTTP interfaces
  (8000..8001).each do |port|
    config.vm.network "forwarded_port", guest: port, host: port
  end

  (5901..5910).each do |port|
    config.vm.network "forwarded_port", guest: port, host: port
  end
  
  (6081..6090).each do |port|
    config.vm.network "forwarded_port", guest: port, host: port
  end

  config.ssh.forward_agent = true
end
