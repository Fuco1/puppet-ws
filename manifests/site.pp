node default {

  Class['cabal::update'] -> Cabal::Install<| |>

  include dev
  include tools
  include desktop
}
