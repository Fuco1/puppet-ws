class xmonad {

  package { 'xmonad':
    ensure => installed,
    require => Package['haskell-platform'],
  }
  ->
  package { 'libghc-xmonad-dev': ensure => installed } ->
  package { 'libghc-xmonad-contrib-dev': ensure => installed }

  exec { '/usr/bin/cabal install dbus strict': } ->
  exec { '/usr/bin/cabal install xmobar --flags="all_extensions"': }

}