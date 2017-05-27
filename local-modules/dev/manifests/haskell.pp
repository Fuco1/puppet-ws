class haskell {

  package { "haskell-platform": ensure => installed } ->
  package { "c2hs": ensure => installed } ->
  package { "hlint": ensure => installed } ->
  exec { 'install-haskell-stack':
    path => ['/bin', '/usr/bin', '/usr/local/bin'],
    command => 'wget -qO- https://get.haskellstack.org/ | sh',
    user => $root,
    environment => "HOME=${home[$user]}",
    unless => 'which stack',
  }

}
