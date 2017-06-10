class cabal::update (
  String $user = lookup('user'),
  String $home = lookup("home.${user}"),
){
  exec { 'cabal update':
    path        => ['/bin', '/usr/bin', '/usr/local/bin'],
    environment => "HOME=${home}",
    require     => Package['haskell-platform'],
  }
}
