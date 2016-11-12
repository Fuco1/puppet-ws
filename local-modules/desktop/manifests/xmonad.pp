class xmonad {
  include cabal

  file { ["${home[$user]}/dev", "${home[$user]}/dev/haskell"]:
    ensure => directory,
    require => User[$user],
  } ->
  # TODO: link .xmonad/ binary into ~/bin/xmonad
  # TODO: make sure .xinitrc has /home/matus/bin/xmonad as the entry point
  cabal::fromgit { "${home[$user]}/dev/haskell/xmonad":
    source   => 'https://github.com/xmonad/xmonad.git',
  } ->
  cabal::fromgit { "${home[$user]}/dev/haskell/xmonad-contrib":
    source   => 'https://github.com/xmonad/xmonad-contrib.git',
  }

  cabal::install { 'dbus': }
  cabal::install { 'strict': }
  cabal::install { 'xmobar':
    flags => '--flags="all_extensions"',
    require => [
      Package['libasound2-dev'],
      Package['libiw-dev'],
      Package['libxpm-dev'],
      Cabal::Fromgit["${home[$user]}/dev/haskell/xmonad-contrib"],
    ],
    unless => "ls ${home[$user]}/.cabal/bin/xmobar"
  }
}
