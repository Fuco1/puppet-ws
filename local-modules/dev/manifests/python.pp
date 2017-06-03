class dev::python {

  class { '::python' :
    version    => 'system',
    pip        => 'present',
    dev        => 'present',
    virtualenv => 'present',
    gunicorn   => 'absent'
  }

  ::python::pip { 'virtualfish': pkgname => 'virtualfish' }

}
