class projects::rolfvandekrol {
  $dir = "${boxen::config::srcdir}/rolfvandekrol"

  repository { "${dir}":
    source => 'rolfvandekrol/rolfvandekrol.nl'
  }

  ruby::local { $dir: 
    version => '1.9.3',
    require => Repository[$dir]
  }
}
