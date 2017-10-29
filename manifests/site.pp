node default {

  Class['cabal::update'] -> Cabal::Install<| |>
  Class['apt::update'] -> Package<| |>

  include dev
  include tools
  include desktop
}
