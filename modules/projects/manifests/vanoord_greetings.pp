class projects::vanoord_greetings {
  $dir = "${boxen::config::srcdir}/vanoord-greetings"
  
  repository { "${dir}":
    source => 'hoppinger/vanoord-greetings'
  }

  ruby::local { $dir: 
    version => '1.9.3',
    require => Repository[$dir]
  }

  file { "${dir}/.rbenv-gemsets":
    content => '.gems',
    require => Repository[$dir]
  }
}