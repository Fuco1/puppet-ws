class mintppa {

  define ppa ($id) {
    apt::ppa { $name:
      options => '-y',
    }
    ->
    apt::key { $name:
      id => $id,
    }
  }
}
