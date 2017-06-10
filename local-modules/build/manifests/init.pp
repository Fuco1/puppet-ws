class build (
  String $user = lookup('user'),
  String $home = lookup("home.${user}"),
) {

  file { "${home}/sources": ensure => directory }

}
