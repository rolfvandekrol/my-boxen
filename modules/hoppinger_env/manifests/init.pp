class hoppinger_env {
  # node versions
  include nodejs::v0_6
  include nodejs::v0_8
  include nodejs::v0_10

  # default ruby versions
  ruby::version { '2.0.0': }
  ruby::version { '2.1.0': }
  ruby::version { '2.1.1': }
  ruby::version { '2.1.2': }
  
  include sublime_text_3
  include sublime_text_3::package_control
  # sublime_text_2::package { 'Puppet':
  #   source => 'eklein/sublime-text-puppet'
  # }

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

  include osx::global::disable_remote_control_ir_receiver

  osx::recovery_message { 'recovery message':
    value => "This Mac is owned by Hoppinger and used by ${::github_name}. If it is found, please call +31 10 221 01 90."
  }
}