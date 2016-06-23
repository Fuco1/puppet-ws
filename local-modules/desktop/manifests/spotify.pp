class spotify {

  apt::source { 'spotify':
    location    => 'http://repository.spotify.com',
    release     => 'testing',
    repos       => 'non-free',
    key         => {
      id => 'BBEBDCB318AD50EC6865090613B00F1FD2C19886',
      server => 'subkeys.pgp.net',
    },
    include => { src => false },
    pin         => 400
  }
  ->
  package { 'spotify-client-0.9.17': ensure => installed }

}
