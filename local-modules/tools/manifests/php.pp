class tools::php (
  String $user = lookup('user'),
  String $home = lookup("home.${user}"),
) {

  mintppa::ppa { 'ppa:ondrej/php':
    id => '14AA40EC0831756756D7F66C4F4EA0AAE5267A6C',
  }

  package { 'php7.1':
    ensure  => installed,
    require => Mintppa::Ppa['ppa:ondrej/php'],
  }

  file { '/tmp/composer-installer.sh':
    ensure => present,
    source => 'puppet:///modules/tools/php/composer-installer.sh',
    owner  => $user,
    group  => $user,
    mode   => '0700',
  }

  file { "${home}/.composer":
    ensure => directory,
    owner  => $user,
    group  => $user,
    mode   => '0755',
  }

  exec { 'install-composer':
    path        => ['/usr/bin', '/bin', "${home}/.local/bin"],
    command     => "bash /tmp/composer-installer.sh && mv composer.phar \"${home}/.local/bin/composer\"",
    user        => $user,
    environment => "HOME=${home}",
    unless      => 'which composer',
    require     => [
      Package['php7.1'],
      File['/tmp/composer-installer.sh'],
      File["${home}/.local/bin"],
    ],
  }
  ~> exec { 'php-language-server':
    path        => ['/bin', '/usr/bin', "${home}/.local/bin"],
    cwd         => "${home}/.composer",
    command     => 'composer global require felixfbecker/language-server && composer run-script --working-dir=vendor/felixfbecker/language-server parse-stubs',
    user        => $user,
    environment => "HOME=${home}",
    unless      => "test -f ${home}/.composer/vendor/bin/php-language-server.php",
    require     => [
      Exec['install-composer'],
      File["${home}/.composer"]
    ]
  }
  ~> exec { 'psysh':
    path        => ['/bin', '/usr/bin', "${home}/.local/bin"],
    cwd         => "${home}/.composer",
    command     => 'composer global require psy/psysh:@stable',
    user        => $user,
    environment => "HOME=${home}",
    unless      => "test -f ${home}/.composer/vendor/bin/psysh",
    require     => [
      Exec['install-composer'],
      File["${home}/.composer"]
    ]
  }

}
