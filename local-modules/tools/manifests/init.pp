class tools {

  include tools::docker
  include tools::cask
  include tools::php
  include tools::wine
  include tools::tagsistant
  include tools::rclone

  package { 'virtualbox': ensure => installed }
  package { 'vagrant':
    ensure  => installed,
    require => Package['virtualbox'],
  }

  # version control
  include tools::git
  package { 'mercurial': ensure => installed }

  # avconv
  package { 'libav-tools': ensure => installed } ->
  package { 'libavcodec-extra': ensure => installed }

  # stow
  package { 'stow': ensure => installed }

  # m17n - internalization, support for devanagari rendering
  package { 'm17n-db': ensure => installed } ->
  package { 'm17n-lib-bin': ensure => installed }

  # input methods
  package { 'ibus': ensure => installed }

  # monitoring
  package { 'htop': ensure => installed }
  package { 'ioping': ensure => installed }
  package { 'iputils-ping': ensure => installed }
  package { 'iotop': ensure => installed }
  package { 'lshw': ensure => installed }
  package { 'lsof': ensure => installed }

  package { 'imagemagick': ensure => installed }
  package { 'less': ensure => installed }
  package { 'gnupg': ensure => installed } ->
  package { 'gnupg-agent': ensure => installed }
  package { 'curl': ensure => installed }
  package { 'netcat': ensure => installed }
  package { 'wget': ensure => installed }
  package { 'whois': ensure => installed }
  package { 'pcregrep': ensure => installed }
  package { 'silversearcher-ag': ensure => installed }

  package { 'alsa-base': ensure => installed }
  package { 'pulseaudio': ensure => installed }

  package { 'libiw-dev': ensure => installed }

  package { 'dbus': ensure => installed }

  #file system
  package { 'avfs': ensure => installed }
  package { 'fuse': ensure => installed }
  package { 'libfuse-dev': ensure => installed }

  # databases
  package { 'mysql-client': ensure => installed }
  package { 'sqlite3': ensure => installed }

  package { 'pandoc': ensure => installed }

}
