class emacs::dependencies {

  package { 'libjpeg-dev': ensure => installed }
  package { 'libgif-dev': ensure => installed }
  package { 'libtiff-dev': ensure => installed }
  package { 'libxml2-dev': ensure => installed }
  package { 'librsvg2-dev': ensure => installed }
  package { 'libmagickwand-dev': ensure => installed }
  package { 'libcairo2-dev': ensure => installed }
  package { 'libotf-dev': ensure => installed }
  package { 'libdbus-1-dev': ensure => installed }
  package { 'libgconf2-dev': ensure => installed }

}
