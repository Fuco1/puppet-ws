class tools {
  # version control
  include git

  # avconv
  package { "libav-tools": ensure => installed } ->
  package { "libavcodec-extra": ensure => installed }

  # stow
  package { "stow": ensure => installed }

  # m17n - internalization, support for devanagari rendering

  package { "libm17n-dev": ensure => installed } ->
  package { "m17n-db": ensure => installed } ->
  package { "m17n-lib-bin": ensure => installed }

  # input methods
  package { "ibus": ensure => installed }

}
