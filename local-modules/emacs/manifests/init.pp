class emacs {

  class { 'emacs::dependencies': } ->
  class { 'emacs::install': }

}
