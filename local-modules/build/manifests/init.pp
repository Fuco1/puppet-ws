class build {

  # TODO: make this configurable
  file { "${home[$user]}/sources": ensure => directory }

}
