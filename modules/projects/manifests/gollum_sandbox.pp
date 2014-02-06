class projects::gollum_sandbox {
  $dir = "${boxen::config::srcdir}/gollum-sandbox"
  
  file { "${dir}":
    ensure => 'directory',
  }

  ruby::local { $dir: 
    version => '1.9.3',
    require => File[$dir]
  }

  file { "${dir}/.rbenv-gemsets":
    content => '.gems',
    require => File[$dir]
  }
}