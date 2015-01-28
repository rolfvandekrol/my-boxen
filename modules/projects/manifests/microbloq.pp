class projects::microbloq {
  $server_name = 'microbloq.dev'

  include nginx::config
  include nginx


  file { "${nginx::config::sitesdir}/microbloq.conf":
    content => template('projects/nginx_microbloq.conf.erb'),
    require => File[$nginx::config::sitesdir],
    notify  => Service['dev.nginx'],
  }
}