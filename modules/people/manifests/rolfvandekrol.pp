class people::rolfvandekrol {
  include spotify

  include zsh
  include ohmyzsh
  file { "/Users/${::luser}/.zshrc":
    source => "file:///Users/${::luser}/.oh-my-zsh/templates/zshrc.zsh-template",
    require => Repository['robbyrussell/oh-my-zsh'],
  }

  file { "/Users/${::luser}/.oh-my-zsh/lib/00-boxen.zsh":
    content => "export LC_ALL=en_US.UTF-8\nexport LANG=en_US.UTF-8\n\nsource ${boxen::config::home}/env.sh",
    require => Repository['robbyrussell/oh-my-zsh'],
  }

  include flux
  include skype

  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::global::disable_autocorrect
  include osx::finder::show_all_on_desktop
  include osx::finder::unhide_library
  include osx::disable_app_quarantine
  include osx::no_network_dsstores


  include php::5_4
  include php::5_3

  include mysql
  include drush
  include drush::kraftwagen

  include projects::anwbmotor
  include projects::gs1
  include projects::mattheus
}
