$home = {
  matus => '/home/matus',
  root => '/root',
}

node default {
  $user = 'root'
  include dev
  include tools
  include cabal
  Class['cabal::update'] -> Cabal::Install<| |>

  include desktop
}
