class desktop {
  include spotify
  include xmonad
  include hunspell
  include slack
  include twmn
  include zathura
  include emacs

  package { 'trayer': ensure => installed }
  package { 'fonts-inconsolata': ensure => installed }
  package { 'fish': ensure => installed }
  package { 'tmux': ensure => installed }
  package { 'anki': ensure => installed }
  package { 'rxvt-unicode-256color': ensure => installed }
  package { 'xsel': ensure => installed }
  package { 'xclip': ensure => installed }
  package { 'adobe-flashplugin': ensure => installed }
  package { 'pass': ensure => installed }
  package { 'ledger': ensure => installed }
  package { 'qbittorrent': ensure => installed }
  package { 'vlc': ensure => installed }
  package { 'mplayer': ensure => installed }
  package { 'd-feet': ensure => installed }

  package { 'at-spi2-core': ensure => purged }

  ::python::pip { 'youtube_dl':
    ensure => installed,
    pkgname => 'youtube_dl',
  }

  cron { 'org-git-commit':
    command => '/home/matus/bin/org-git-commit',
    user    => $user,
    minute  => 0,
  }

  cron { 'run-getmail':
    command => '/home/matus/bin/run-getmail',
    user    => $user,
    minute  => 55,
  }

  file { "${home[$user]}/download-local":
    ensure => directory,
    user   => $user,
    group  => $user,
  }
  file { "${home[$user]}/bin":
    ensure => directory,
    user   => $user,
    group  => $user,
  }

  # get rid of useless directories
  file { "${home[$user]}/Desktop": ensure => absent, force => true, }
  file { "${home[$user]}/Downloads": ensure => absent, force => true, }
  file { "${home[$user]}/Pictures": ensure => absent, force => true, }
  file { "${home[$user]}/Templates": ensure => absent, force => true, }
  file { "${home[$user]}/Videos": ensure => absent, force => true, }
  file { "${home[$user]}/Music": ensure => absent, force => true, }

}
