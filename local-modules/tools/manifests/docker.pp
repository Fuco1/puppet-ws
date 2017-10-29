class tools::docker {

  include desktop::config

  apt::source { 'docker':
    location     => 'https://download.docker.com/linux/ubuntu',
    architecture => 'amd64',
    release      => 'xenial',
    repos        => 'stable',
    key          => {
      id => '9DC858229FC7DD38854AE2D88D81803C0EBFCD88',
    },
    include      => {
      'src' => false,
    },
  }

  package { 'docker-ce':
    ensure  => '17.03.2~ce-0~ubuntu-xenial',
    notify  => Service['docker'],
    require => [
      Apt::Source['docker'],
      Class['apt::update']
    ],
  }
  -> User <| title == $desktop::config::user |> { groups +> 'docker' }


  exec { 'install-docker-compose':
    path    => ['/usr/bin', '/bin'],
    command => 'curl -L https://github.com/docker/compose/releases/download/1.14.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && chmod 755 /usr/local/bin/docker-compose',
    unless  => 'test -f /usr/local/bin/docker-compose',
    require => [
      Package['curl'],
    ],
  }


  if $::systemd_present {
    service { 'docker':
      ensure   => running,
      provider => systemd
    }
  } else {
    service { 'docker': ensure => running }
  }
}
