class desktop (
  String $user = $desktop::config::user,
  String $home = $desktop::config::home,
) {

  file { '/var/cache/wget': ensure => directory }

  include desktop::config

  include desktop::files
  include desktop::users

  include desktop::spotify
  include xmonad
  include desktop::hunspell
  include desktop::slack
  include desktop::twmn
  include desktop::zathura
  include desktop::fish
  include desktop::autojump

  build::install { 'emacs-build':
    git       => 'git@github.com:Fuco1/emacs-build.git',
    build_env => vagrant,
    require   => [
      Package['stow'],
    ],
  }

  build::install { 'tmux-build':
    git      => 'git@github.com:Fuco1/tmux-build.git',
    revision => 'release/bionic',
  }

  package { 'trayer': ensure => installed }
  package { 'chrony': ensure => installed }
  package { 'fonts-inconsolata': ensure => installed }
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
  package { 'notmuch': ensure => installed }
  package { 'isync': ensure => installed }
  package { 'chromium-browser': ensure => installed }
  package { 'arandr': ensure => installed }
  package { 'pasystray': ensure => installed }

  package { 'at-spi2-core': ensure => purged }
  package { 'notify-osd': ensure => purged }

  ::python::pip { 'youtube_dl':
    ensure  => installed,
    pkgname => 'youtube_dl',
  }

  cron { 'org-git-commit':
    command => "${home}/.local/bin/org-git-commit",
    user    => $user,
    minute  => 0,
  }

  cron { 'run-getmail':
    command => "${home}/.local/bin/run-getmail",
    user    => $user,
    minute  => 55,
  }

  file_line { 'mlocate-prunenames':
    path => '/etc/updatedb.conf',
    line => 'PRUNENAMES=".git .bzr .hg .svn .cache Trash .mozilla _cacache"',
  }

}
