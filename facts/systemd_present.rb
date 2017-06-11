require 'facter'
Facter.add('systemd_present') do
  setcode do
    system('which systemctl >/dev/null')
  end
end
