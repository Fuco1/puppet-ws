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

}
