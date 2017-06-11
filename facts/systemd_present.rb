require 'facter'
Facter.add('systemd_present') do
  setcode do
    system('systemctl --version')
  end
end
