class mintppa {
  include apt

  define ppa ($id) {
    apt::ppa { "$name":
      options => '-y',
      package_manage => true,
      package_name => 'software-properties-common',
    }
    ->
    apt::key { 'ppa:git-core/ppa':
      id => "$id",
    }
  }
}
