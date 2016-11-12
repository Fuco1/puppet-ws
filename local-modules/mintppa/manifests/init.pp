class mintppa {
  include apt

  define ppa ($id) {
    apt::ppa { "$name":
      options => '-y',
    }
    ->
    apt::key { "$name":
      id => "$id",
    }
  }
}
