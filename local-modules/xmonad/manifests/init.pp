class xmonad (
  String $user = lookup('user'),
  String $home = lookup("home.${user}"),
  String $haskell_root = "${home}/dev/haskell"
) {

  class { 'xmonad::dependencies': }
  -> class { 'xmonad::install': }

  file { '/usr/share/xsessions/custom.desktop':
    source => 'puppet:///modules/xmonad/custom.desktop',
    owner  => 'root',
    group  => 'root',
    mode   => '0644'
  }

}
