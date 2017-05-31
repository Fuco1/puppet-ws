class php {

  mintppa::ppa { 'ppa:ondrej/php':
    id => '14AA40EC0831756756D7F66C4F4EA0AAE5267A6C',
  }

  package { 'php5.6':
    ensure  => installed,
    require => Mintppa::Ppa['ppa:ondrej/php'],
  }

  package { 'php7.0':
    ensure  => installed,
    require => Mintppa::Ppa['ppa:ondrej/php'],
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
    path        => ['/usr/bin', '/bin'],
    command     => "bash /tmp/composer-installer.sh && mv composer.phar \"${home[$user]}/bin/composer\"",
    user        => $user,
    environment => "HOME=${home[$user]}",
    unless      => "test -d ${home[$user]}/.composer -o -d ${home[$user]}/.config/composer",
    require     => [
      Package['php7.1'],
      File['/tmp/composer-installer.sh'],
      File["${home[$user]}/bin"],
    ],
  }

}
