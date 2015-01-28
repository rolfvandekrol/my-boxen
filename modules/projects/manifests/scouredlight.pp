
class projects::scouredlight {
  include nginx::config
  $version = '5.4.17'
  $server_name = "scouredlight.dev"

  file { "${boxen::config::srcdir}/scouredlight":
    ensure => directory,
  }

  php::local { "${boxen::config::srcdir}/scouredlight":
    version => $version,
    require => File["${boxen::config::srcdir}/scouredlight"]
  }

  php::fpm::pool { "scouredlight":
    version     => $version,
    socket_path => "${boxen::config::socketdir}/scouredlight",
    require     => File["${nginx::config::sitesdir}/scouredlight.conf"],
  }

  file { "${nginx::config::sitesdir}/scouredlight.conf":
    content => template("projects/nginx_scouredlight.conf.erb"),
    require => File[$nginx::config::sitesdir],
    notify  => Service['dev.nginx'],
  }

  mysql::db { "scouredlight_development": }
}