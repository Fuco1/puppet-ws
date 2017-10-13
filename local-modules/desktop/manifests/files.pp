class desktop::files {

  include desktop::config

  file { $desktop::config::home:
    ensure => directory,
    owner  => $desktop::config::user,
    group  => $desktop::config::user,
  }

  file { "${desktop::config::home}/sources":
    ensure => directory,
    owner  => $desktop::config::user,
    group  => $desktop::config::user,
  }

  file { "${desktop::config::home}/download-local":
    ensure => directory,
    owner  => $desktop::config::user,
    group  => $desktop::config::user,
  }

  file { [
    "${desktop::config::home}/.local/",
    "${desktop::config::home}/.local/bin",
  ]:
    ensure => directory,
    owner  => $desktop::config::user,
    group  => $desktop::config::user,
  }

  # get rid of useless directories
  file { "${desktop::config::home}/Desktop": ensure => absent, force => true, }
  file { "${desktop::config::home}/Downloads": ensure => absent, force => true, }
  file { "${desktop::config::home}/Pictures": ensure => absent, force => true, }
  file { "${desktop::config::home}/Templates": ensure => absent, force => true, }
  file { "${desktop::config::home}/Videos": ensure => absent, force => true, }
  file { "${desktop::config::home}/Music": ensure => absent, force => true, }

}
