
class projects::drupal8 {
  $server_name = 'drupal8.dev'

  file { "${boxen::config::srcdir}/drupal8":
    ensure => directory,
  }

  php::local { "${boxen::config::srcdir}/drupal8":
    version => '5.4.17',
    require => File["${boxen::config::srcdir}/drupal8"]
  }
  ruby::local { "${boxen::config::srcdir}/drupal8": 
    version => '1.9.3',
    require => File["${boxen::config::srcdir}/drupal8"]
  }
  ruby::gem { "compass for 1.9.3 (drupal8)":
    gem     => 'compass',
    ruby    => '1.9.3',
    version => '~> 0.12.2'
  }
  
  include drush

  include nginx::config
  include nginx

  $version = "5.4.17"
  php::fpm::pool { "drupal8":
    version     => $version,
    socket_path => "${boxen::config::socketdir}/drupal8",
    require     => File["${nginx::config::sitesdir}/drupal8.conf"],
  }

  file { "${nginx::config::sitesdir}/drupal8.conf":
    content => template('projects/nginx_drupal8.conf.erb'),
    require => File[$nginx::config::sitesdir],
    notify  => Service['dev.nginx'],
  }

  mysql::db { "drupal8_development": }
}
