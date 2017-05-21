class desktop {
  include spotify
  include xmonad
  include hunspell

  package { "trayer": ensure => installed }
  package { "fonts-inconsolata": ensure => installed }
  package { "fish": ensure => installed }
  package { "tmux": ensure => installed }
  package { "anki": ensure => installed }

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
