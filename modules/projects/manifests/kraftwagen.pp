
class projects::kraftwagen {
  $server_name = 'kraftwagen.dev'

  file { "${nginx::config::sitesdir}/kraftwagen.conf":
    content => template('projects/nginx_kraftwagen.conf.erb'),
    notify  => Service['dev.nginx'],
  }

}
