# TODO: magic dependency on $home and $user
class cabal {

  define install (
    $flags = '',
    $unless = "ghc-pkg list ${name} | grep ${name}"
    ) {
    exec { "cabal install $name $flags":
      environment => "HOME=${home[$user]}",
      path => ['/bin', '/usr/bin', '/usr/local/bin'],
      require => Exec['cabal update'],
      unless => $unless
    }
  }
}
