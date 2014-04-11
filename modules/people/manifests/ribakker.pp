class people::ribakker {
  include hoppinger_zsh
  include hoppinger_env

  # Apps
  include flux
  include spotify

  # PHP / Drupal development environment
  include php::5_4
  include php::5_3

  include mysql
  include drush
  include drush::kraftwagen

  include projects::sp
}
