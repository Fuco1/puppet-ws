define build::install (
  $git = undef,
  $target = $name,
  $builduser = 'root',
  $installuser = 'root',
  $docker = true,
) {
  include build

  if $docker {
    $requireDocker = [Class['docker']]
  } else {
    $requireDocker = [Class['docker']]
  }

  vcsrepo { "build-vcs-${name}":
    ensure => present,
    provider => git,
    source => $git,
    path => "${home[$user]}/sources/${target}",
    require => File["${home[$user]}/sources"],
    user => $user
  }
  ~>
  exec { "build-build-${name}":
    path => ['/usr/bin', '/bin'],
    cwd => "${home[$user]}/sources/${target}",
    command => "bash build.sh",
    user => $builduser,
    require => $requireDocker,
    refreshonly => true,
  }
  ~>
  exec { "build-install-${name}":
    path => ['/usr/bin', '/bin'],
    cwd => "${home[$user]}/sources/${target}",
    command => "test -f install.sh && bash install.sh",
    user => $installuser,
    require => $requireDocker,
    refreshonly => true,
  }

}
