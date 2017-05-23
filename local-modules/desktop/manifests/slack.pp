class slack {

  file { '/var/cache/wget': ensure => directory }

  wget::fetch { 'slack-deb':
    source => 'https://downloads.slack-edge.com/linux_releases/slack-desktop-2.6.0-amd64.deb',
    destination => '/tmp/',
    cache_dir => '/var/cache/wget',
    require => File['/var/cache/wget'],
  }

  package { 'slack-desktop':
    provider => dpkg,
    ensure => latest,
    source => "/tmp/slack-desktop-2.6.0-amd64.deb",
    require => Wget::Fetch['slack-deb'],
  }

}
