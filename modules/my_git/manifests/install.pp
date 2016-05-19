# Install latest git
class my_git::install {
  apt::ppa { 'ppa:git-core/ppa':
    options => '-y',
  }

  apt::key { 'ppa:git-core/ppa':
    id=>'E1DD270288B4E6030699E45FA1715D88E1DF1F24',
  }

  package { 'git':
    ensure => 'present',
    install_options => ['--force-yes', '-y',],
    require => [
        Apt::Key['ppa:git-core/ppa'],
        Apt::Ppa['ppa:git-core/ppa'],
        Class['apt::update'],
    ],
  }
}
