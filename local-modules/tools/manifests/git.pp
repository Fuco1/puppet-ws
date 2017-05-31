# Install latest git from ppa instead of ubuntu repository
class tools::git {

  mintppa::ppa { 'ppa:git-core/ppa':
    id=>'E1DD270288B4E6030699E45FA1715D88E1DF1F24'
  }
  ->
  package { 'git':
    ensure          => 'latest',
    install_options => ['--force-yes', '-y',],
  }

}
