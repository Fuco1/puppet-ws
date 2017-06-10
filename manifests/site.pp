node default {
  $user = lookup('user')
  $home = lookup("home.${user}")

  file { $home: ensure => directory }
  -> user { $user:
    ensure => present,
    home   => $home,
  }

  Class['cabal::update'] -> Cabal::Install<| |>

  include dev
  include tools
  include desktop
}
