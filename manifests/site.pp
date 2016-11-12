$home = {
  matus => '/home/matus',
  root => '/root',
}

node default {
  $user = 'matus'

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
