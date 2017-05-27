class xmonad {

  class { 'xmonad::dependencies': } ->
  class { 'xmonad::install': }

  file { "/usr/share/xsessions/custom.desktop":
    source => "puppet:///modules/xmonad/custom.desktop",
    owner => "root",
    group => "root",
    mode => 0644
  }

}
