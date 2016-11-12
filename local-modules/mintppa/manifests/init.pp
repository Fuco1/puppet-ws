class mintppa {
  include apt

  define ppa ($id) {
    apt::ppa { "$name":
      options => '-y',
    }
    ->
    apt::key { 'ppa:git-core/ppa':
      id => "$id",
    }
  }
}
