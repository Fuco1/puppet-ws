class tools::rclone {

  wget::fetch { 'rclone-deb':
    source      => 'https://github.com/ncw/rclone/releases/download/v1.40/rclone-v1.40-linux-amd64.deb',
    destination => '/tmp/',
    cache_dir   => '/var/cache/wget',
    require     => File['/var/cache/wget'],
  }

  package { 'rclone-tools':
    ensure   => latest,
    provider => dpkg,
    source   => '/tmp/rclone-v1.40-linux-amd64.deb',
    require  => Wget::Fetch['rclone-deb'],
  }

}
