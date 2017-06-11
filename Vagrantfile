Vagrant.require_version "~> 1.8"

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.define "puppet-ws" do |ws|
    ws.vm.hostname = "puppet-ws"

    ws.vm.provider "virtualbox" do |v|
      v.name = "puppet-ws"
      v.linked_clone = true
      v.cpus = 2
    end

    ws.vm.provision :file, source: "common.sh", destination: "/home/ubuntu/common.sh"
    ws.vm.provision :shell do |s|
      s.path = "bootstrap"
      s.args = ["--no-run"]
      s.env = {"INSTALL_PATH" => "/home/ubuntu"}
    end
  end

end
