define dockerbuild::install (
  $git = undef,
  $target = $name,
) {
  include dockerbuild

  vcsrepo { "dockerbuild-${name}":
    ensure => present,
    provider => git,
    source => $git,
    path => "${home[$user]}/sources/${target}",
    require => File["${home[$user]}/sources"],
    user => $user
  }
  ~>
  exec { "dockerbuild-build-${name}":
    path => ['/usr/bin', '/bin'],
    cwd => "${home[$user]}/sources/${target}",
    command => "bash build.sh",
    user => "root",
    require => Class['docker'],
    refreshonly => true,
  }
  ~>
  exec { "dockerbuild-install-${name}":
    path => ['/usr/bin', '/bin'],
    cwd => "${home[$user]}/sources/${target}",
    command => "test -f install.sh && bash install.sh",
    user => "root",
    refreshonly => true,
  }

}
