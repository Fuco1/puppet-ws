class tagsistant {

  package { 'libglib2.0-dev': ensure => installed }
  package { 'libextractor-dev': ensure => installed }
  package { 'libdbi-dev': ensure => installed }
  package { 'libdbd-sqlite3': ensure => installed }

  build::install { 'tagsistant-build':
    git     => 'git@github.com:Fuco1/tagsistant-build.git',
    require => [
      Package['libglib2.0-dev'],
      Package['libextractor-dev'],
      Package['libdbi-dev'],
      Package['sqlite3'],
      Package['libdbd-sqlite3'],
    ],
  }

}
