class haskell {

  package { "haskell-platform": ensure => installed } ->
  package { "haskell-stack": ensure => installed } ->
  package { "c2hs": ensure => installed } ->
  package { "hlint": ensure => installed }

}
