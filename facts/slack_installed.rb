require 'facter'
Facter.add('slack_installed') do
  setcode do
    system('test -f /etc/apt/sources.list.d/slack.list')
  end
end
