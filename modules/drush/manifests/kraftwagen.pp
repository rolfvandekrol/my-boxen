
class drush::kraftwagen {
  include drush

  repository { "${boxen::config::home}/drush/commands/kraftwagen":
    ensure => "origin/master",
    source => "kraftwagen/kraftwagen",
    require => File["${boxen::config::home}/drush/commands"],
  }
}