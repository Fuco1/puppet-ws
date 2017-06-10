# TODO: magic dependency on $home and $user
class cabal (
  String $user = lookup('user'),
  String $home = lookup("home.${user}"),
) {

  #include vcsrepo
  include ::cabal::update

  define cabal (
    $command = $name,
    $unless = undef,
    $cwd = undef) {
    exec { "cabal ${name}":
      command     => "cabal ${command}",
      environment => "HOME=${home}",
      path        => ['/bin', '/usr/bin', '/usr/local/bin'],
      require     => Package['haskell-platform'],
      cwd         => $cwd,
      unless      => $unless,
    }
  }

  define install (
    $flags = '',
    $unless = "ghc-pkg list ${name} | grep ${name}"
    ) {
    cabal::cabal { "install ${name} ${flags}":
      unless => $unless
    }
  }

  define compile ($cwd = $name) {
    cabal::cabal { "configure ${cwd}":
      command => 'configure',
      cwd     => $cwd,
    } ->
    cabal::cabal { "install ${cwd}":
      command => 'install',
      cwd     => $cwd,
    }
  }

  define fromgit(
    $source,
    ) {
    vcsrepo { $name:
      ensure   => present,
      provider => git,
      source   => $source,
    } ->
    cabal::compile { $name: }
  }
}
