class desktop {
  include spotify
  include xmonad
  include hunspell
  include slack

  package { "trayer": ensure => installed }
  package { "fonts-inconsolata": ensure => installed }
  package { "fish": ensure => installed }
  package { "tmux": ensure => installed }
  package { "anki": ensure => installed }
  package { "rxvt-unicode-256color": ensure => installed }
  package { "xsel": ensure => installed }
  package { "xclip": ensure => installed }
  package { "adobe-flashplugin": ensure => installed }
  package { "pass": ensure => installed }
  package { "ledger": ensure => installed }
  package { "qbittorrent": ensure => installed }

  cron { 'org-git-commit':
    command => '/home/matus/bin/org-git-commit',
    user => $user,
    minute => 0,
  }

  cron { 'run-getmail':
    command => '/home/matus/bin/run-getmail',
    user => $user,
    minute => 55,
  }

  file { "${home[$user]}/download-local": ensure => directory }

}
