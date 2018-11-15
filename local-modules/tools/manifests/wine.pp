class tools::wine {

  package { 'wine64': ensure => latest } ->
  package { 'winetricks': ensure => latest }

}
