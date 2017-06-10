class desktop (
  String $user = lookup('user'),
  String $home = lookup("home.${user}"),
) {

  include desktop::spotify
  include xmonad
  include desktop::hunspell
  include desktop::slack
  include desktop::twmn
  include desktop::zathura

  build::install { 'emacs-build':
    git       => 'git@github.com:Fuco1/emacs-build.git',
    build_env => vagrant,
    require   => [
      Package['stow'],
      Package['vagrant'],
    ],
  }

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
  package { 'ubuntu-restricted-extras': ensure => installed }
  package { 'd-feet': ensure => installed }

  package { 'at-spi2-core': ensure => purged }

  ::python::pip { 'youtube_dl':
    ensure  => installed,
    pkgname => 'youtube_dl',
  }

  cron { 'org-git-commit':
    command => "${home}/bin/org-git-commit",
    user    => $user,
    minute  => 0,
  }

  cron { 'run-getmail':
    command => "${home}/bin/run-getmail",
    user    => $user,
    minute  => 55,
  }

  file { "${home}/download-local":
    ensure => directory,
    owner  => $user,
    group  => $user,
  }
  file { "${home}/bin":
    ensure => directory,
    owner  => $user,
    group  => $user,
  }

  # get rid of useless directories
  file { "${home}/Desktop": ensure => absent, force => true, }
  file { "${home}/Downloads": ensure => absent, force => true, }
  file { "${home}/Pictures": ensure => absent, force => true, }
  file { "${home}/Templates": ensure => absent, force => true, }
  file { "${home}/Videos": ensure => absent, force => true, }
  file { "${home}/Music": ensure => absent, force => true, }

}
