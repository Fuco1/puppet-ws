class xmonad::install {

  exec { 'install-xmonad':
    path        => ['/bin', '/usr/bin', '/usr/local/bin'],
    cwd         => "${xmonad::home}/.xmonad",
    command     => 'stack install',
    environment => "HOME=${xmonad::home}",
    user        => $xmonad::user,
    unless      => "test -f ${xmonad::home}/bin/xmonad",
    require     => [
      File["${xmonad::home}/bin"],
      Exec['install-haskell-stack'],
    ],
  }

  build::install { 'xmobar-build':
    git       => 'git@github.com:Fuco1/xmobar-build.git',
    target    => "${xmonad::haskell_root}/xmobar-build",
    build_env => 'host',
    require   => [
      Package['libxft-dev'],
      Package['libxrandr-dev'],
      Exec['install-haskell-stack'],
    ]
  }

}
