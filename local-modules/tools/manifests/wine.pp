class wine {

  mintppa::ppa { 'ppa:ubuntu-wine/ppa':
    id=>'883E8688397576B6C509DF495A9A06AEF9CB8DB0'
  }
  ->
  package { 'wine1.8':
    ensure          => 'latest',
    install_options => ['--force-yes', '-y',],
  } ->
  package { 'winetricks': ensure => latest }

}
