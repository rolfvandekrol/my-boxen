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

  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::global::disable_autocorrect
  include osx::finder::show_all_on_desktop
  include osx::finder::unhide_library
  include osx::disable_app_quarantine
  include osx::no_network_dsstores
}
