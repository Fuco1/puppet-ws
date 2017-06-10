# Install the required "build"
define build::install (
  String $user = lookup('user'),
  String $home = lookup("home.${user}"),
  String $git = undef,
  String $target = "${home}/sources/${name}",
  String $builduser = 'root',
  String $installuser = 'root',
  Enum['docker', 'vagrant', 'host'] $build_env = 'docker',
) {
  include build

  $docker_dependencies = [Service['docker']]
  $vagrant_dependencies = [Package['vagrant']]

  if $build_env == 'docker' {
    $build_require = $docker_dependencies
  } elsif $build_env == 'vagrant' {
    $build_require = $vagrant_dependencies
  } else {
    $build_require = []
  }

  vcsrepo { "build-vcs-${name}":
    ensure   => present,
    provider => git,
    source   => $git,
    path     => $target,
    user     => $user,
    require  => Package['git'],
  }
  ~> exec { "build-build-${name}":
    path        => ['/usr/bin', '/bin'],
    cwd         => $target,
    command     => "bash build.sh ${build_env}",
    user        => $builduser,
    require     => $build_require,
    refreshonly => true,
  }
  ~> exec { "build-install-${name}":
    path        => ['/usr/bin', '/bin'],
    cwd         => $target,
    command     => 'test -f install.sh && bash install.sh',
    user        => $installuser,
    require     => $build_require,
    refreshonly => true,
  }

}
