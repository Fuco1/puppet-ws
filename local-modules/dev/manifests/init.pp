class dev {

  package { "build-essential": ensure => installed }
  package { "dpkg-dev": ensure => installed }

  # c + toolchain
  package { "gcc": ensure => installed }
  package { "g++": ensure => installed }
  package { "gnat": ensure => installed }
  package { "gprbuild": ensure => installed }
  package { "make": ensure => installed }
  package { "cmake": ensure => installed }
  package { "autoconf": ensure => installed }
  package { "automake": ensure => installed }
  package { "libtool": ensure => installed }
  package { "intltool": ensure => installed }
  package { "gdb": ensure => installed }
  package { "doxygen": ensure => installed }
  package { "valgrind": ensure => installed }
  package { "ccache": ensure => installed }

  # python
  package { "python-all-dev": ensure => installed } ->
  package { "python-pip": ensure => installed } ->
  package { "python3-all-dev": ensure => installed } ->
  package { "python-virtualenv": ensure => installed } ->
  package { "virtualfish":
    provider => "pip",
    ensure => installed
  }

  # haskell
  package { "haskell-platform": ensure => installed } ->
  exec { "cabal update":
    environment => "HOME=${home[$user]}",
    path => ['/bin', '/usr/bin', '/usr/local/bin'],
  }
  ->
  package { "c2hs": ensure => installed } ->
  package { "hlint": ensure => installed }

}
