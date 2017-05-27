class xmonad::dependencies {

  package { 'libxrandr-dev': ensure => installed }
  package { 'libxft-dev': ensure => installed }

  file { ["${home[$user]}/dev", "${home[$user]}/dev/haskell"]:
    ensure => directory,
    require => User[$user],
  }

  vcsrepo { "${home[$user]}/dev/haskell/xmonad":
    ensure   => present,
    provider => git,
    remote => 'origin',
    source   => {
      'origin' => 'git@github.com:Fuco1/xmonad.git',
      'upstream' => 'git@github.com:xmonad/xmonad.git',
    },
    require => File["${home[$user]}/dev/haskell"],
  }

  vcsrepo { "${home[$user]}/dev/haskell/xmonad-contrib":
    ensure   => present,
    provider => git,
    remote => 'origin',
    source   => {
      'origin' => 'git@github.com:Fuco1/xmonad-contrib.git',
      'upstream' => 'git@github.com:xmonad/xmonad-contrib.git',
    },
    require => File["${home[$user]}/dev/haskell"],
  }

  vcsrepo { "${home[$user]}/dev/haskell/mpris":
    ensure   => present,
    provider => git,
    source   => 'git@github.com:Fuco1/mpris.git',
    require => File["${home[$user]}/dev/haskell"],
  }

  vcsrepo { "${home[$user]}/.xmonad":
    ensure   => present,
    provider => git,
    source   => 'git@github.com:Fuco1/xmonad-config.git',
    require => File["${home[$user]}"],
  }

}
