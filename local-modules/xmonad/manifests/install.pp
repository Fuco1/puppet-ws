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

  build::install { 'xmobar-build':
    git       => 'git@github.com:Fuco1/xmobar-build.git',
    target    => "${home[$user]}/dev/haskell/xmobar-build",
    build_env => 'host',
    require   => [
      Package['libxft-dev'],
      Package['libxrandr-dev'],
    ]
  }

}
