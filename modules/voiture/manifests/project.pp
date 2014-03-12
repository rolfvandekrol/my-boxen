
define voiture::project(
  $source,
  $nginx_template = 'voiture/nginx.conf.erb',
) {
  include mysql
  include voiture::base

  $vhost_docroot = "${boxen::config::srcdir}/${name}"
  $hostname = "${name}.dev"

  file { "${boxen::config::datadir}/voiture/${name}":
    ensure => directory,
    require => File["${boxen::config::datadir}/voiture"]
  }

  exec { "svn checkout ${name}":
    command => "svn co ${source} ${boxen::config::srcdir}/${name}",
    creates => "${boxen::config::srcdir}/${name}"
  }
  php::local { "${boxen::config::srcdir}/${name}":
    version => '5.3.27',
    require => Exec["svn checkout ${name}"]
  }

  include nginx::config
  include nginx

  file { "${nginx::config::sitesdir}/${name}.conf":
    content => template($nginx_template),
    require => File[$nginx::config::sitesdir],
    notify  => Service['dev.nginx'],
  }

  $version = "5.3.27"
  php::fpm::pool { "${name}":
    version     => $version,
    socket_path => "${boxen::config::socketdir}/${name}",
    require     => File["${nginx::config::sitesdir}/${name}.conf"],
  }

  mysql::db { "${name}_development": }
}