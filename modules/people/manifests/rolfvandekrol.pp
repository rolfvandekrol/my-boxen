class people::rolfvandekrol {
  include spotify

  git::config::global { 'user.email':
    value  => 'info@rolfvandekrol.nl'
  }

  git::config::global { 'user.name':
    value  => 'Rolf van de Krol'
  }

  osx::recovery_message { 'recovery message':
    value => "This Mac is owned by Hoppinger and used by Rolf van de Krol. If it is found, please call +31 10 221 01 90."
  }
}
