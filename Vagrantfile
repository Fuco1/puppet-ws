Vagrant.require_version "~> 1.8"

def shell_provision(s)
  s.path = "bootstrap"
  s.args = ["--no-run"]
  s.env = {"INSTALL_PATH" => "/home/ubuntu"}
end

Vagrant.configure("2") do |config|
  config.vm.define "puppet-ws" do |ws|
    ws.vm.hostname = "puppet-ws"

    ws.vm.provider "virtualbox" do |v, override|
      override.vm.box = "ubuntu/xenial64"
      v.name = "puppet-ws"
      v.linked_clone = true
      v.cpus = 2
      override.vm.provision :file, source: "common.sh", destination: "/home/ubuntu/common.sh"
      override.vm.provision :shell do |s|
        shell_provision(s)
      end
    end

    ws.vm.provider "docker" do |d, override|
      override.ssh.username = 'root'
      override.ssh.password = 'root'
      override.ssh.keys_only = false
      d.name = "puppet-ws"
      d.build_dir = "."
      d.has_ssh = true
      override.vm.provision :file, source: "common.sh", destination: "/root/common.sh"
      override.vm.provision :shell do |s|
        shell_provision(s)
        s.privileged = false
      end
    end
  end

end
