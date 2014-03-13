class people::rolfvandekrol {
  include hoppinger_zsh

  # Apps
  include flux
  include skype
  include spotify

  # OS X settings
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::global::disable_autocorrect
  include osx::finder::show_all_on_desktop
  include osx::finder::unhide_library
  include osx::disable_app_quarantine
  include osx::no_network_dsstores

  # PHP / Drupal development environment
  include php::5_4
  include php::5_3

  include mysql
  include drush
  include drush::kraftwagen

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
