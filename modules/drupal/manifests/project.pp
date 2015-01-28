
define drupal::project(
  $server_name   = "${name}.dev",
  $nginx_template = 'drupal/nginx.conf.erb',
) {
  include mysql
  include boxen::config

  $dir = "${boxen::config::srcdir}/${name}"

  file { "${boxen::config::srcdir}/${name}":
    ensure => directory
  }
  file { "${boxen::config::srcdir}/${name}/httpdocs":
    ensure => directory,
    require     => File[$dir]
  }

  php::local { $dir:
    version => '5.3.27',
    require     => File[$dir]
  }
  
  include drush

  include nginx::config
  include nginx

  file { "${nginx::config::sitesdir}/${name}.conf":
    content => template($nginx_template),
    require => File[$nginx::config::sitesdir],
    notify  => Service['dev.nginx'],
  }

  mysql::db { "${name}_development": }

  $version = "5.3.27"
  php::fpm::pool { "${name}":
    version     => $version,
    socket_path => "${boxen::config::socketdir}/${name}",
    require     => File["${nginx::config::sitesdir}/${name}.conf"],
  }
}
