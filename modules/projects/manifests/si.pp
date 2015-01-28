
class projects::si {
  $dir = "${boxen::config::srcdir}/stemtool"

  repository { "${dir}":
    source => 'hoppinger/stemtool'
  }

  ruby::version { 'jruby-1.7.12': }

  ruby::local { $dir: 
    version => 'jruby-1.7.12',
    require => Repository[$dir]
  }

  package { 'jboss-as': }

  file { "${dir}/.rbenv-gemsets":
    content => '.gems',
    require => Repository[$dir]
  }
}
