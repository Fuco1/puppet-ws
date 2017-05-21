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

  Class['cabal::update'] -> Cabal::Install<| |>

  include dev
  include tools
  include desktop
}
