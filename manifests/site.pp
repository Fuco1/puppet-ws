$home = {
  matus => '/home/matus',
  root => '/root',
}

node default {
  $user = 'root'
  include dev
  include tools
  include apt
  Class['apt::update'] -> Package<| |>

  include cabal
  Class['cabal::update'] -> Cabal::Install<| |>

  include desktop
}
