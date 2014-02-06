class voiture::base {
  file { "${boxen::config::datadir}/voiture":
    ensure => directory
  }
}