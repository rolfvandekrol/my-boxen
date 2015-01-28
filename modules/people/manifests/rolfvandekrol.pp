class people::rolfvandekrol {
  include hoppinger_zsh
  include hoppinger_env

  # Apps
  include skype

  # PHP / Drupal development environment
  include php::5_4
  include php::5_3

  require php::config
  require php::5_3_27
  $php = "5.3.27"

  file { "${php::config::configdir}/${php}/conf.d/uploads.ini":
    content => template("people/uploads.ini.erb"),
    notify => Service["dev.php-fpm.5.3.27"],
  }

  include mysql
  include drush
  include drush::kraftwagen

  include inkscape

  repository { "${boxen::config::srcdir}/DrupalUpdater":
    source => "git@github.com:hoppinger/DrupalUpdater.git"
  }

  include projects::all

  # # Hoppinger projects
  # include projects::anwbmotor
  # include projects::gs1
  # include projects::vanoord_greetings
  # include projects::radtech
  # include projects::omroepwest
  # include projects::hvc
  # include projects::wvhg

  # # Own projects
  # include projects::mattheus
  # include projects::gollum_sandbox
  # include projects::tcc
  # include projects::mvdk
}
