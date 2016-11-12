class cabal::update {
  exec { "cabal update":
    path => ['/bin', '/usr/bin', '/usr/local/bin'],
    environment => "HOME=${home[$user]}",
  }
}
