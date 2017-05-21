class cask {

  exec { 'install-cask':
    path => ['/usr/bin'],
    command => 'curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python',
    require => [Class['python'], Package['curl']],
    user => $user,
    environment => "HOME=${home[$user]}",
    unless => "test -d ${home[$user]}/.cask",
  }
}
