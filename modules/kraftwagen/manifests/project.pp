
define kraftwagen::project(
  $source,
  $server_name   = "${name}.dev",
  $server_aliases = "",
) {
  include boxen::config
  php::local { "${boxen::config::srcdir}/${name}":
    version => '5.3.27'
  }
  ruby::local { "${boxen::config::srcdir}/${name}": 
    version => '1.9.3'
  }
  ruby_gem { "compass for 1.9.3 (${name})":
    gem     => 'compass',
    ruby_version    => '1.9.3',
    version => '~> 0.12.2'
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
