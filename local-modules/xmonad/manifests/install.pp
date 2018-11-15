class xmonad::install {

  exec { 'install-xmonad':
    path        => ['/bin', '/usr/bin', '/usr/local/bin', "${xmonad::home}/.local/bin"],
    cwd         => "${xmonad::home}/.xmonad",
    command     => 'stack install',
    environment => "HOME=${xmonad::home}",
    user        => $xmonad::user,
    unless      => 'which xmonad',
    require     => [
      File["${xmonad::home}/.local/bin"],
      Vcsrepo["${xmonad::home}/.xmonad"],
      Exec['install-haskell-stack'],
    ],
  }

  build::install { 'xmobar-build':
    git         => 'git@github.com:Fuco1/xmobar-build.git',
    target      => "${xmonad::haskell_root}/xmobar-build",
    build_env   => 'host',
    installuser => $xmonad::user,
    builduser   => $xmonad::user,
    path_extra  => ['/usr/local/bin'],
    environment => ["HOME=${xmonad::home}"],
    require     => [
      Package['libxft-dev'],
      Package['libxrandr-dev'],
      Package['libxinerama-dev'],
      Package['libxss-dev'],
      Exec['install-haskell-stack'],
    ]
  }

}
