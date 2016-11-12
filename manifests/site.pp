$home = {
  matus => '/home/matus',
  root => '/root',
}

node default {
  $user = 'matus'

  file { "${home[$user]}": ensure => directory } ->
  user { "$user":
    ensure => present,
    home => "${home[$user]}",
  }

  include apt
  Class['apt::update'] -> Package<| |>

  include cabal
  Class['cabal::update'] -> Cabal::Install<| |>

  include dev
  include tools
  include desktop
}
