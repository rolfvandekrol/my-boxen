
class drush {
  require boxen::config

  file { "${boxen::config::home}/drush":
    ensure  => directory,
  }

  file { "${boxen::config::home}/drush/commands":
    ensure  => directory,
    require => File["${boxen::config::home}/drush"],
  }

  file { "${boxen::config::home}/drush/drushrc.php":
    content => template('drush/drushrc.php.erb'),
    require => File["${boxen::config::home}/drush"],
  }

  repository { "${boxen::config::home}/drush/drush":
    ensure => "origin/6.x",
    source => "drush-ops/drush",
    require => File["${boxen::config::home}/drush"],
  }

  file { "${boxen::config::bindir}/drush":
    ensure  => link,
    target  => "${boxen::config::home}/drush/drush/drush",
    mode    => '0755',
    require => Repository["${boxen::config::home}/drush/drush"],
  }

  file { "/Users/${::boxen_user}/.drush":
    ensure  => directory,
  }
  file { "/Users/${::boxen_user}/.drush/drushrc.php":
    ensure  => link,
    target  => "${boxen::config::home}/drush/drushrc.php",
    require => File["/Users/${::boxen_user}/.drush"],
  }
}