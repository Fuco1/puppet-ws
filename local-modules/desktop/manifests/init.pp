class desktop {
  include spotify
  include xmonad
  include hunspell

  package { "trayer": ensure => installed }

  cron { 'org-git-commit':
    command => '/home/matus/bin/org-git-commit',
    minute => 0,
  }

  cron { 'run-getmail':
    command => '/home/matus/bin/run-getmail',
    minute => 55,
  }
}
