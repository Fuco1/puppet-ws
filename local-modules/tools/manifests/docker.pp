class tools::docker {

  package { 'docker.io':
    ensure => present,
    notify => Service['docker'],
  }
  -> User <| title == $desktop::config::user |> { groups +> 'docker' }


  package { 'docker-compose': ensure => present }

  if $::systemd_present {
    service { 'docker':
      ensure => running,
      provider => systemd
    }
  } else {
    service { 'docker': ensure => running }
  }
}
