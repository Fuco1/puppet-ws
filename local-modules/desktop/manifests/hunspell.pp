class desktop::hunspell {

  package { 'hunspell': ensure => installed }
  -> package { [
    'hunspell-de-de',
    'hunspell-en-us',
    'hunspell-fr',
    'hunspell-ru',
    'hunspell-it',
    'hunspell-cs',
    'hunspell-sk',
  ]:
    ensure => installed
  }
  -> file { '/usr/share/hunspell/la_LA.aff':
    source => 'puppet:///modules/desktop/hunspell/la_LA.aff',
    owner  => 'root',
    group  => 'root',
    mode   => '0644'
  }
  -> file { '/usr/share/hunspell/la_LA.dic':
    source => 'puppet:///modules/desktop/hunspell/la_LA.dic',
    owner  => 'root',
    group  => 'root',
    mode   => '0644'
  }

}
