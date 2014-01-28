
class projects::mattheus {
  $dir = "${boxen::config::srcdir}/mattheus"

  file { $dir:
    ensure => directory
  }

  ruby::local { $dir: 
    version => '1.9.3',
    require => File[$dir]
  }

  repository { "${dir}/data":
    source => 'hebreeuwsmattheus/data'
  }
  repository { "${dir}/website":
    source => 'hebreeuwsmattheus/website'
  }
  repository { "${dir}/tools":
    source => 'hebreeuwsmattheus/tools'
  }
}
