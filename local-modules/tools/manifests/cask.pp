class tools::cask (
  String $user = lookup('user'),
  String $home = lookup("home.${user}"),
) {

  exec { 'install-cask':
    path        => ['/usr/bin'],
    command     => 'curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python',
    require     => [Class['python'], Package['curl']],
    user        => $user,
    environment => "HOME=${home}",
    unless      => "test -d ${home}/.cask",
  }
}
