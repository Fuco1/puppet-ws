class desktop::twmn {

  package { 'libboost-program-options1.58.0': ensure => installed }

  build::install { 'twmn-build':
    git => 'git@github.com:Fuco1/twmn-build.git'
  }

}
