class emacs::install {

  build::install { 'emacs-build':
    git => 'git@github.com:Fuco1/emacs-build.git'
  }

}
