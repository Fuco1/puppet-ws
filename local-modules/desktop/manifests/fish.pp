class desktop::fish {

  mintppa::ppa { 'ppa:fish-shell/release-2':
    id=>'59FDA1CE1B84B3FAD89366C027557F056DC33CA5'
  }
  ->
  package { 'fish': ensure => latest }

}
