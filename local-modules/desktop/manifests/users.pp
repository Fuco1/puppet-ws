class desktop::users {

  include desktop::config

  @user { $desktop::config::user:
    ensure => present,
    home   => $desktop::config::home,
  }

  User <| title == $desktop::config::user |>

}
