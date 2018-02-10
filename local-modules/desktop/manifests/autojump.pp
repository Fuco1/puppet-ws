class desktop::autojump (
  String $user = $desktop::config::user,
  String $home = $desktop::config::home,
) {

  vcsrepo { "${home}/sources/autojump":
    ensure   => present,
    provider => git,
    remote   => 'origin',
    source   => {
      'origin'   => 'https://github.com/wting/autojump.git',
    },
    require  => File["${home}/sources"],
  }

  exec { 'install-autojump':
    path    => ['/usr/bin', '/bin'],
    cwd     => "${home}/sources/autojump",
    command => "python install.py --prefix ${home}/.local/ --destdir ${home}/.local/",
    user    => $user,
    unless  => "test -f ${home}/.local/share/autojump/autojump.fish",
    require => [
      Vcsrepo["${home}/sources/autojump"],
      File["${home}/.local"],
    ]
  }
  ~> file_line { 'fish-autojump-config':
    path => "${home}/.config/fish/config.fish",
    line => "if test -f ${home}/.local/share/autojump/autojump.fish; . ${home}/.local/share/autojump/autojump.fish; end",
  }

}
