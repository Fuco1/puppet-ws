# TODO: magic dependency on $home and $user
class cabal {

  include ::cabal::update

  define install (
    $flags = '',
    $unless = "ghc-pkg list ${name} | grep ${name}"
    ) {
    exec { "cabal install $name $flags":
      environment => "HOME=${home[$user]}",
      path => ['/bin', '/usr/bin', '/usr/local/bin'],
      require => Package['haskell-platform'],
      unless => $unless
    }
  }
}
