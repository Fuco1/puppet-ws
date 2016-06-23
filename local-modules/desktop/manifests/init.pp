class desktop {
  include spotify
  include xmonad
  include hunspell

  package { "trayer": ensure => installed }
}
