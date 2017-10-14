class dev::python {

  include ::python

  ::python::pip { 'virtualfish': pkgname => 'virtualfish' }
  ::python::pip { 'setuptools': pkgname => 'setuptools' }
  ::python::pip { 'python-mpd2': pkgname => 'python-mpd2' }

}
