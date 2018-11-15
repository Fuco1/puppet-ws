# Install the required "build"
define build::install (
  String $user = lookup('user'),
  String $home = lookup("home.${user}"),
  String $git = undef,
  String $target = "${home}/.local/share/build-base/${name}",
  String $builduser = 'root',
  String $installuser = 'root',
  String $revision = 'master',
  Array[String] $environment = [],
  Array[String] $path_extra = [],
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
    revision => $revision,
    require  => Package['git'],
  }
  ~> exec { "build-build-${name}":
    path        => [$target, '/usr/bin', '/bin'] + $path_extra,
    cwd         => $target,
    command     => "build ${build_env}",
    user        => $builduser,
    require     => $build_require,
    environment => $environment,
    refreshonly => true,
    timeout     => 3600,
  }
  ~> exec { "build-install-${name}":
    path        => [$target, '/usr/bin', '/bin'] + $path_extra,
    cwd         => $target,
    command     => 'test -f install && install',
    user        => $installuser,
    require     => $build_require,
    environment => $environment,
    refreshonly => true,
    timeout     => 3600,
  }

}
