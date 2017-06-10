class xmonad::dependencies {

  package { 'libxrandr-dev': ensure => installed }
  package { 'libxft-dev': ensure => installed }

  file { ["${xmonad::home}/dev", "${xmonad::home}/dev/haskell"]:
    ensure  => directory,
    require => User[$xmonad::user],
  }

  vcsrepo { "${xmonad::haskell_root}/xmonad":
    ensure   => present,
    provider => git,
    remote   => 'origin',
    source   => {
      'origin'   => 'git@github.com:Fuco1/xmonad.git',
      'upstream' => 'git@github.com:xmonad/xmonad.git',
    },
    require  => File[$xmonad::haskell_root],
  }

  vcsrepo { "${xmonad::haskell_root}/xmonad-contrib":
    ensure   => present,
    provider => git,
    remote   => 'origin',
    source   => {
      'origin'   => 'git@github.com:Fuco1/xmonad-contrib.git',
      'upstream' => 'git@github.com:xmonad/xmonad-contrib.git',
    },
    require  => File[$xmonad::haskell_root],
  }

  vcsrepo { "${xmonad::haskell_root}/mpris":
    ensure   => present,
    provider => git,
    source   => 'git@github.com:Fuco1/mpris.git',
    require  => File[$xmonad::haskell_root],
  }

  vcsrepo { "${xmonad::home}/.xmonad":
    ensure   => present,
    provider => git,
    source   => 'git@github.com:Fuco1/xmonad-config.git',
    require  => File[$xmonad::home],
  }

}
