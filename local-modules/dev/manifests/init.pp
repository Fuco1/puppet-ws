class dev {

  package { "build-essential": ensure => installed }
  package { "dpkg-dev": ensure => installed }

  # c + toolchain
  package { "make": ensure => installed }
  package { "autoconf": ensure => installed }
  package { "automake": ensure => installed }
  package { "libtool": ensure => installed }
  package { "gdb": ensure => installed }
  package { "valgrind": ensure => installed }
  package { "ccache": ensure => installed }

  # python
  package { "python-all-dev": ensure => installed } ->
  package { "python3-all-dev": ensure => installed } ->
  package { "python-virtualenv": ensure => installed } ->
  package { "virtualfish":
    provider => "pip",
    ensure => installed
  }

  # haskell
  package { "haskell-platform": ensure => installed } ->
  package { "c2hs": ensure => installed } ->
  package { "hlint": ensure => installed }

}