class xmonad::install {

  exec { 'install-xmonad':
    path        => ['/bin', '/usr/bin', '/usr/local/bin'],
    cwd         => "${home[$user]}/.xmonad",
    command     => 'stack install',
    environment => "HOME=${home[$user]}",
    user        => $user,
    unless      => "test -f ${home[$user]}/bin/xmonad",
    require     => [
      File["${home[$user]}/bin"],
      Exec['install-haskell-stack'],
    ],
  }

}
