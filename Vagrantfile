Vagrant.require_version ">= 1.7.0"

Vagrant.configure(2) do |config|
  config.vm.box = "debian/jessie64"

  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "vvv"
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

  (5900..5910).each do |port|
    config.vm.network "forwarded_port", guest: port, host: port
  end
  config.vm.network "forwarded_port", guest: 4300, host: 4300
end
