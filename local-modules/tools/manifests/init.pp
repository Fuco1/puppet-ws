class tools {
  # version control
  include git
  package { "mercurial": ensure => installed }

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

  # monitoring
  package { "htop": ensure => installed }
  package { "ioping": ensure => installed }
  package { "iputils-ping": ensure => installed }
  package { "iotop": ensure => installed }
  package { "lshw": ensure => installed }
  package { "lsof": ensure => installed }

  package { "imagemagick": ensure => installed }
  package { "less": ensure => installed }
  package { "gnupg": ensure => installed } ->
  package { "gnupg-agent": ensure => installed }
  package { "curl": ensure => installed }
  package { "netcat": ensure => installed }
  package { "wget": ensure => installed }
  package { "whois": ensure => installed }
  package { "pcregrep": ensure => installed }

  package { "alsa-base": ensure => installed }
  package { "libasound2-dev": ensure => installed }
  package { "pulseaudio": ensure => installed }

  package { "libiw-dev": ensure => installed }
  package { "libxpm-dev": ensure => installed }
}
