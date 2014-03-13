class people::ribakker {
  include hoppinger_zsh

  # Apps
  include flux
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

  include projects::sp
}
