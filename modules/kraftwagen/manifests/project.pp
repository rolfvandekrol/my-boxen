
define kraftwagen::project(
  $source,
  $server_name   = "${name}.dev",
) {
  include boxen::config
  php::local { "${boxen::config::srcdir}/${name}":
    version => '5.3.27'
  }
  include drush
  include drush::kraftwagen

  boxen::project { $name:
    source => $source,
    dir => "${boxen::config::srcdir}/${name}/src",
    mysql => true,
    nginx => 'kraftwagen/nginx.conf.erb',
    server_name => $server_name
  }

  $version = "5.3.27"
  php::fpm::pool { "${name}":
    version     => $version,
    socket_path => "${boxen::config::socketdir}/${name}",
    require     => File["${nginx::config::sitesdir}/${name}.conf"],
  }
}
