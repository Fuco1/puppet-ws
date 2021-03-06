class desktop::twmn (
  String $repository = 'git@github.com:Fuco1/twmn-build.git'
) {

  include ::apt

  include desktop::files
  include desktop::users

  include tools::git
  include tools::docker

  package { 'libboost-program-options1.58.0': ensure => installed }
  package { 'libboost-system1.58.0': ensure => installed }

  build::install { 'twmn-build':
    git => $repository,
    require => [
      Package['libboost-program-options1.58.0'],
      Package['libboost-system1.58.0'],
    ],
  }

}
