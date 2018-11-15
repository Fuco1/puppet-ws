class desktop::twmn (
  String $repository = 'git@github.com:Fuco1/twmn-build.git'
) {

  include ::apt

  include desktop::files
  include desktop::users

  include tools::git
  include tools::docker

  package { 'libboost-program-options1.65.1': ensure => installed }
  package { 'libboost-system1.65.1': ensure => installed }

  build::install { 'twmn-build':
    git => $repository,
    require => [
      Package['libboost-program-options1.65.1'],
      Package['libboost-system1.65.1'],
    ],
  }

}
