class dev {

  # haskell
  package { "haskell-platform": ensure => installed } ->
  package { "c2hs": ensure => installed } ->
  package { "hlint": ensure => installed }

}
