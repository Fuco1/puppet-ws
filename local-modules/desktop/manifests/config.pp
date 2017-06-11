class desktop::config (
  String $user = lookup('user'),
  String $home = lookup("home.${user}"),
) {

}
