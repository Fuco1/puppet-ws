class dev::python {

  include ::python

  ::python::pip { 'virtualfish': pkgname => 'virtualfish' }

}
