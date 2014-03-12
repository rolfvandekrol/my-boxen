class projects::omroepwest {
  voiture::project { 'omroepwest':
    source => "svn+ssh://repos.hoppinger.net/svn/omroepwest/trunk",
    nginx_template => 'projects/nginx_omroepwest.conf.erb'
  }

  repository { "${boxen::config::srcdir}/omroepwest-erasmus":
    source => 'hoppinger/omroepwest-erasmus'
  }
}