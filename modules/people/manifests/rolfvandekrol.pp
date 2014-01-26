class people::rolfvandekrol {
  include spotify

  git::config::global { 'user.email':
    value  => 'info@rolfvandekrol.nl'
  }

  git::config::global { 'user.name':
    value  => 'Rolf van de Krol'
  }
}
