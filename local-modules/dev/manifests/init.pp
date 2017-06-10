class dev {

  include dev::python
  include dev::haskell

  include dev::libraries

  package { 'build-essential': ensure => installed }
  package { 'dpkg-dev': ensure => installed }

  # c + toolchain
  package { 'gcc': ensure => installed }
  package { 'g++': ensure => installed }
  package { 'gnat': ensure => installed }
  package { 'gprbuild': ensure => installed }
  package { 'make': ensure => installed }
  package { 'cmake': ensure => installed }
  package { 'autoconf': ensure => installed }
  package { 'automake': ensure => installed }
  package { 'libtool': ensure => installed }
  package { 'intltool': ensure => installed }
  package { 'gdb': ensure => installed }
  package { 'doxygen': ensure => installed }
  package { 'valgrind': ensure => installed }
  package { 'ccache': ensure => installed }

}
