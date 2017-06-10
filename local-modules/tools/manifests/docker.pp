class tools::docker {

  package { 'docker.io':
    ensure => present,
    notify => Service['docker'],
  }

  package { 'docker-compose': ensure => present }

  service { 'docker':
    ensure => running,
    provider => systemd
  }

}
