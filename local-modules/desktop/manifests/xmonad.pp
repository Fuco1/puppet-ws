class xmonad {

  package { 'xmonad':
    ensure => installed,
    require => Package['haskell-platform'],
  }
  ->
  package { 'libghc-xmonad-dev': ensure => installed } ->
  package { 'libghc-xmonad-contrib-dev': ensure => installed }

  include cabal
  cabal::install { 'dbus': }
  cabal::install { 'strict': }
  cabal::install { 'xmobar':
    flags => '--flags="all_extensions"',
    require => [
      Package['libasound2-dev'],
      Package['libiw-dev'],
      Package['libxpm-dev'],
    ],
    unless => "ls ${home[$user]}/.cabal/bin/xmobar"
  }
}
