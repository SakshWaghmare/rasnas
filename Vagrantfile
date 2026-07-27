Vagrant.configure("2") do |config|

  # Ubuntu 22.04 LTS
  config.vm.box = "ubuntu/jammy64"

  # Disable automatic box update check
  config.vm.box_check_update = false

  # -----------------------------
  # Automation VM
  # -----------------------------
  config.vm.define "automation" do |automation|

    automation.vm.hostname = "automation"

    automation.vm.network "private_network", ip: "192.168.56.10"

    automation.vm.provider "virtualbox" do |vb|
      vb.name = "automation"
      vb.memory = 4096
      vb.cpus = 2
    end

    automation.vm.provision "shell",
      path: "provisioning/automation.sh"

  end

  # -----------------------------
  # Target VM
  # -----------------------------
  config.vm.define "target" do |target|

    target.vm.hostname = "target"

    target.vm.network "private_network", ip: "192.168.56.20"

    target.vm.provider "virtualbox" do |vb|
      vb.name = "target"
      vb.memory = 2048
      vb.cpus = 2
    end

    target.vm.provision "shell",
      path: "provisioning/target.sh"

  end

end