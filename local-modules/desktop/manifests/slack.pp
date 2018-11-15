class desktop::slack (
  String $version = '3.0.0'
){

  if $::slack_installed {
    package { 'slack-desktop': ensure => latest }
  }
  else {
    wget::fetch { 'slack-deb':
      source      => "https://downloads.slack-edge.com/linux_releases/slack-desktop-${version}-amd64.deb",
      destination => '/tmp/',
      cache_dir   => '/var/cache/wget',
      require     => File['/var/cache/wget'],
    }

    package { 'slack-desktop':
      ensure   => latest,
      provider => dpkg,
      source   => "/tmp/slack-desktop-${version}-amd64.deb",
      require  => Wget::Fetch['slack-deb'],
    }
  }
}
