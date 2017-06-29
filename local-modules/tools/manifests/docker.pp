class tools::docker {

  include desktop::config

  package { 'docker.io':
    ensure => present,
    notify => Service['docker'],
  }
  -> User <| title == $desktop::config::user |> { groups +> 'docker' }


  exec { 'install-docker-compose':
    path => ['/usr/bin', '/bin'],
    command => 'curl -L https://github.com/docker/compose/releases/download/1.14.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && chmod 755 /usr/local/bin/docker-compose',
    unless => 'test -f /usr/local/bin/docker-compose',
    require => [
      Package['curl'],
    ],
  }


  if $::systemd_present {
    service { 'docker':
      ensure => running,
      provider => systemd
    }
  } else {
    service { 'docker': ensure => running }
  }
}
